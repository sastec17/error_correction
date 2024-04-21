import json

DEV_DB = ['twitter_1', 'college_2', 'soccer_1', 'storm_record', 'movie_1', 'behavior_monitoring', 'culture_company', 'riding_club']
SQL_DICT_KEYS = ('select', 'from', 'where', 'groupBy', 'having', 'orderBy', 'limit', 'intersect', 'union', 'except')

db_path = "data/spider/database"
table_file = "data/spider/tables.json"

empty_clause = {
    "from": "",
    "where": "",
    "groupBy": "",
    "having": "",
    "select": "",
    "orderBy": "",
    "limit": "",
    "intersect": "",
    "except": "",
    "union": ""
}

empty_sql_label = {
    "except": None,
    "from": {
        "conds": [],
        "table_units": []
    },
    "groupBy": [],
    "having": [],
    "intersect": None,
    "limit": None,
    "orderBy": [],
    "select": [
        False,
        []
    ],
    "union": None,
    "where": []
}

class Schema:
    """
    Simple schema which maps table&column to a unique identifier
    """
    def __init__(self, schema, table):
        self._schema = schema
        self._table = table
        self._idMap = self._map(self._schema, self._table)

    @property
    def schema(self):
        return self._schema

    @property
    def idMap(self):
        return self._idMap

    def _map(self, schema, table):
        column_names_original = table['column_names_original']
        table_names_original = table['table_names_original']

        for i, (tab_id, col) in enumerate(column_names_original):
            if tab_id == -1:
                idMap = {'*': i}
            else:
                key = table_names_original[tab_id].lower()
                val = col.lower()
                idMap[key + "." + val] = i

        for i, tab in enumerate(table_names_original):
            key = tab.lower()
            idMap[key] = i

        return idMap


def get_schemas_from_json(fpath):
    with open(fpath) as f:
        data = json.load(f)
    db_names = [db['db_id'] for db in data]

    tables = {}
    schemas = {}
    pydict_schemas = {}
    for db in data:
        db_id = db['db_id']
        schema = {} #{'table': [col.lower, ..., ]} * -> __all__
        column_types = db['column_types'] 
        column_names_original = db['column_names_original']
        pydict_schema = {}
        col_info_list = []
        table_names_original = db['table_names_original']
        foreign_keys = get_foreign_keys(db, column_names_original, table_names_original)
        # print(foreign_keys)
        # break
        # foreign_key_pairs = db['foreign_keys']
        # foreign_keys = []
        # for pair in foreign_key_pairs:
        #     foreign_keys.extend(pair)

        for i, (table_index, column_name) in enumerate(column_names_original):
            # fk_value = False
            # if i in foreign_keys:
            #     fk_value = True
            # if i == 0 or i == 1: continue
            table_name = db['table_names_original'][table_index]
            # print(column_name.lower())
            # print(foreign_keys)
            # print(f"{table_name}:{column_name.lower()}")
            foreign_key = foreign_keys.get(f"{table_name}:{column_name.lower()}", 'n/a')
            # print(foreign_key)
            # break
            col_info_wrapper = []
            col_info_wrapper.append(table_index)
            col_info = {
                "column_name": column_name,
                "column_type": column_types[i],
                "foreign_key": foreign_key
            }
            col_info_wrapper.append(json.dumps(col_info))
            col_info_list.append(col_info_wrapper)
        # break
        tables[db_id] = {'column_names_original': column_names_original, 'table_names_original': table_names_original}
        for i, tabn in enumerate(table_names_original):
            table = str(tabn.lower())
            cols = [str(col_info.lower()) for td, col_info in col_info_list if td == i]
            # print(cols)
            pydict_schema[table] = cols
            
            cols = [str(col.lower()) for td, col in column_names_original if td == i]
            schema[table] = cols
        schemas[db_id] = schema 
        pydict_schemas[db_id] = pydict_schema  

    return schemas, db_names, tables, pydict_schemas

def get_foreign_keys(db, column_names_original, table_names_original):
    """
    Returns foreign key relations for a single db as follows:
    { "table1:col1" : "table2:col5",
                "table2:col4" : "table3:col7"}
    }
    """
    db_foreign_keys = db['foreign_keys']
    relations = {}
    for item in db_foreign_keys:
        key1, key2 = item 
        # get the corresponding column / table names 
        table1, name1 = column_names_original[key1]
        table2, name2 = column_names_original[key2]
        # get table names
        table1 = table_names_original[table1]
        table2 = table_names_original[table2]
        relations[str(table1.lower())+ ':' + str(name1.lower())] =\
                    str(table2.lower()) + '.' + str(name2.lower())
        
        relations[str(table2.lower()) + ':' + str(name2.lower())] =\
                    str(table1.lower())+ '.' + str(name1.lower())
    return relations

schemas, db_names, tables, pydict_schemas = get_schemas_from_json(table_file)
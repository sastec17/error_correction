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
        # print(column_names_original[0])
        for i, (tab_id, col, _) in enumerate(column_names_original):
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
    """From "data/spider/tables.json" """
    with open(fpath) as f:
        data = json.load(f)
    db_names = [db['db_id'] for db in data]

    tables = {}
    schemas = {}
    foreign_keys = {}
    print('In schemas.json')
    for db in data:
        db_id = db['db_id']
        schema = {} #{'table': [col.lower, ..., ]} * -> __all__ MODIFY THIS IN SOME CAPACITY??? IMPLICATIONS? 
        
        # get corresponding column types
        column_types = db['column_types']   
        column_names_original = db['column_names_original']     # holds [<int>, <column_name>], where the int is the table identifier
        
        # pair column_names with the column types
        for i in range(len(column_types)):
            column_names_original[i].append(column_types[i])
        
        
        table_names_original = db['table_names_original']       # just list of corresponding table names
        tables[db_id] = {'column_names_original': column_names_original, 'table_names_original': table_names_original}
        for i, tabn in enumerate(table_names_original):
            table = str(tabn.lower())       # grab tablename
            # DONE: EXTRACT AND FORMAT COLUMN NAME INFORAMTION HERE 
            cols = [str(col.lower()) +':'+col_type for td, col, col_type in column_names_original if td == i]   # get corresponding colNames for this table
            schema[table] = cols
        schemas[db_id] = schema


        # Process foreign keys based off of foreign keys
        # iterate over the foreign_keys table in the db
        # TODO: test shit (locally) 
        db_foreign_keys = db['foreign_keys']
        relations = []
        for item in db_foreign_keys:
            key1, key2 = item 
            # get the corresponding column / table names 
            table1, name1, type1 = column_names_original[key1]
            table2, name2, type2 = column_names_original[key2]
            # get table names
            table1 = table_names_original[table1]
            table2 = table_names_original[table2]
            pair = str(table1.lower())+ '.' + str(name1.lower()) + ':' + type1 + '=' +\
                   str(table2.lower()) + '.' + str(name2.lower()) + ':' + type2 
            relations.append(pair)
        foreign_keys[db_id] = relations

    return schemas, db_names, tables, foreign_keys

schemas, db_names, tables, foreign_keys = get_schemas_from_json(table_file)
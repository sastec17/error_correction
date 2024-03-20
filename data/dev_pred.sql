select count(*) from singer
select count(*) from singer
select singer.name, singer.country, singer.age from singer order by singer.age desc
select singer.name, singer.country, singer.age from singer order by singer.age desc
select avg(singer.age), min(singer.age), max(singer.age) from singer where singer.country = "France"
select avg(singer.age), min(singer.age), max(singer.age) from singer where singer.country = "French"
select singer.song_name, singer.song_release_year from singer order by singer.age asc limit 1
select singer.song_name, singer.song_release_year from singer order by singer.age asc limit 1
select distinct singer.country from singer where singer.age > 20
select distinct singer.country from singer where singer.age > 20
select singer.country, count(*) from singer group by singer.country
select singer.country, count(*) from singer group by singer.country
select singer.song_name from singer where singer.age > (select avg(singer.age) from singer)
select singer.song_name from singer where singer.age > (select avg(singer.age) from singer)
select stadium.location, stadium.name from stadium where stadium.capacity between 5000 and 10000
select stadium.location, stadium.name from stadium where stadium.capacity between 5000 and 10000
select max(stadium.capacity), avg(stadium.average) from stadium
select avg(stadium.capacity), max(stadium.capacity) from stadium
select stadium.name, stadium.capacity from stadium order by stadium.average desc limit 1
select stadium.name, stadium.capacity from stadium order by stadium.average desc limit 1
select count(*) from concert where concert.year = 2014 or concert.year = 2015
select count(*) from concert where concert.year = 2014 or concert.year = 2015
select stadium.name, count(*) from concert join stadium on concert.stadium_id = stadium.stadium_id group by concert.stadium_id
select stadium.stadium, count(*) from concert join stadium on concert.stadium_id = stadium.stadium_id group by stadium.stadium_id
select stadium.name, stadium.capacity from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year >= 2014 group by concert.stadium_id order by count(*) desc limit 1
select stadium.name, stadium.capacity from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year > 2013 group by concert.stadium_id order by count(*) desc limit 1
select concert.year from concert group by concert.year order by count(*) desc limit 1
select concert.year from concert group by concert.year order by count(*) desc limit 1
select stadium.name from stadium where stadium.stadium_id not in (select concert.stadium_id from concert)
select stadium.name from stadium where stadium.stadium_id not in (select concert.stadium_id from concert)
select singer.country from singer where singer.age > 40 intersect select singer.country from singer where singer.age < 30
select stadium.name from stadium except select stadium.name from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2014
select stadium.name from stadium except select stadium.name from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2014
select concert.concert_name, concert.theme, count(*) from singer_in_concert join concert on singer_in_concert.concert_id = concert.concert_id group by singer_in_concert.concert_id
select concert.concert_name, concert.theme, count(*) from singer_in_concert join concert on singer_in_concert.concert_id = concert.concert_id group by singer_in_concert.concert_id
select singer.name, count(*) from singer_in_concert join singer on singer_in_concert.singer_id = singer.singer_id group by singer.name
select singer.name, count(*) from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id group by singer.name
select singer.name from concert join singer_in_concert on concert.concert_id = singer_in_concert.concert_id join singer on singer_in_concert.singer_id = singer.singer_id where concert.year = 2014
select singer.name from singer_in_concert join concert on singer_in_concert.concert_id = concert.concert_id join singer on singer_in_concert.singer_id = singer.singer_id where concert.year = 2014
select singer.name, singer.country from singer where singer.song_name like "%Hey%"
select singer.name, singer.country from singer where singer.song_name like "%Hey%"
select stadium.name, stadium.location from stadium join concert on stadium.stadium_id = concert.stadium_id where concert.year = 2014 intersect select stadium.name, stadium.location from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2015
select stadium.name, stadium.location from stadium join concert on stadium.stadium_id = concert.stadium_id where concert.year = 2014 intersect select stadium.name, stadium.location from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2015
select count(*) from concert join stadium on concert.stadium_id = stadium.stadium_id order by stadium.capacity desc limit 1
select count(*) from stadium join concert on stadium.stadium_id = concert.stadium_id where stadium.capacity = (select max(stadium.capacity) from stadium)
select count(*) from pets where pets.weight > 10
select count(*) from pets where pets.weight > 10
select pets.weight from pets where pets.pettype = "dog"
select min(pets.weight) from pets where pets.pettype = "dog"
select pets.pettype, max(pets.weight) from pets group by pets.pettype
select pets.pettype, max(pets.weight) from pets group by pets.pettype
select count(distinct pets.petid) from pets join has_pet on pets.petid = has_pet.petid join student on has_pet.stuid = student.stuid where student.age > 20
select count(*) from has_pet where has_pet.pet_age > 20
select count(*) from has_pet join pets on has_pet.petid = pets.petid join student on has_pet.stuid = student.stuid where student.sex = "F" and pets.pettype = "dog"
select count(*) from pets where pets.pettype = "dog" and student.sex = "F"
select count(distinct pets.pettype) from pets
select count(distinct pets.pettype) from pets
select distinct student.fname from has_pet join pets on has_pet.petid = pets.petid join student on has_pet.stuid = student.stuid where pets.pettype = "cat" or pets.pettype = "dog"
select distinct student.fname from has_pet join pets on has_pet.petid = pets.petid join student on has_pet.stuid = student.stuid where pets.pettype = "cat" or pets.pettype = "dog"
select student.fname from has_pet join pets on has_pet.petid = pets.petid join student on has_pet.stuid = student.stuid where pets.pettype = "cat" intersect select student.fname from has_pet join pets on has_pet.petid = pets.petid join student on has_pet.stuid = student.stuid where pets.pettype = "dog"
select student.fname from has_pet join pets on has_pet.petid = pets.petid join student on has_pet.stuid = student.stuid where pets.pettype = "cats" intersect select student.fname from has_pet join pets on has_pet.petid = pets.petid join student on has_pet.stuid = student.stuid where pets.pettype = "dogs"
select student.major, student.age from student where student.stuid not in (select has_pet.stuid from has_pet where pets.pettype = "cat")
select student.major, student.age from student where student.stuid not in (select has_pet.stuid from has_pet where pets.pettype = "cat")
select student.stuid from student except select has_pet.stuid from has_pet where pets.pettype = "cat"
select student.stuid from student except select has_pet.stuid from has_pet where has_pet.pettype = "cat"
select student.fname, student.age from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = "dog" except select student.fname, student.age from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = "cat"
select student.fname from student join has_pet on student.stuid = has_pet.stuid where pets.pettype = "dog" except select student.fname from student join has_pet on student.stuid = has_pet.stuid where pets.pettype = "cat"
select pets.pettype, pets.weight from pets order by pets.pet_age asc limit 1
select pets.pettype, pets.weight from pets order by pets.pet_age asc limit 1
select pets.petid, pets.weight from pets where pets.pet_age > 1
select pets.petid, pets.weight from pets where pets.pet_age > 1
select avg(pets.pet_age), max(pets.pet_age), pets.pettype from pets group by pets.pettype
select avg(pets.pet_age), max(pets.pet_age), pets.pettype from pets group by pets.pettype
select pets.pettype, avg(pets.weight) from pets group by pets.pettype
select pets.pettype, avg(pets.weight) from pets group by pets.pettype
select distinct student.fname, student.age from student join has_pet on student.stuid = has_pet.stuid
select distinct student.fname, student.age from student join has_pet on student.stuid = has_pet.stuid
select has_pet.petid from has_pet join student on has_pet.stuid = student.stuid where student.lname = "Smith"
select has_pet.petid from has_pet join student on has_pet.stuid = student.stuid where student.lname = "Smith"
select count(*), has_pet.petid join student on has_pet.stuid = student.stuid from has_pet join pets on has_pet.petid = pets.petid join student on has_pet.stuid = student.stuid group by has_pet.petid
select has_pet.stuid, count(*) from has_pet group by has_pet.stuid
select student.fname, student.sex from student join has_pet on student.stuid = has_pet.stuid group by has_pet.stuid having count(*) > 1
select student.fname, student.sex from student join has_pet on student.stuid = has_pet.stuid group by has_pet.stuid having count(*) > 1
select student.lname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = "cat" and student.age = 3
select student.lname from student where student.age = 3
select avg(student.age) from student where student.stuid not in (select has_pet.stuid from has_pet)
select avg(student.age) from student where student.stuid not in (select has_pet.stuid from has_pet)
select count(*) from continents
select count(*) from continents
select continents.contid, continents.continent, count(*) from continents join countries on continents.contid = countries.continent group by countries.continent
select continents.contid, countries.continent, count(*) from countries join continents on countries.countryid = continents.contid group by continents.contid
select count(*) from countries
select count(*) from countries
select car_makers.fullname, car_makers.id, count(*) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select car_makers.fullname, car_makers.id, count(*) from model_list join car_makers on model_list.maker = car_makers.id group by car_makers.id
select car_names.model from cars_data join car_names on cars_data.id = car_names.makeid order by cars_data.horsepower asc limit 1
select car_names.model from cars_data join car_names on cars_data.id = car_names.makeid order by cars_data.horsepower asc limit 1
select car_names.model from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.weight < (select avg(cars_data.weight) from cars_data)
select car_names.model from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.weight < (select avg(cars_data.weight) from cars_data)
select distinct car_makers.fullname from car_makers where car_makers.year = 1970
select distinct car_makers.maker from car_makers where car_makers.year = 1970
select car_names.make, car_names.production from car_names join cars_data on car_names.makeid = cars_data.id order by cars_data.year asc limit 1
select car_makers.maker, cars_data.year from car_makers join cars_data on car_makers.id = cars_data.id order by cars_data.year asc limit 1
select distinct car_names.model from car_names join model_list on car_names.make = model_list.modelid where car_names.year > 1980
select distinct model_list.model from cars_data join model_list on cars_data.id = model_list.modelid where cars_data.year > 1980
select continents.continent, count(*) from car_makers join continents on car_makers.continent = continents.continent group by continents.continent
select continents.continent, count(*) from car_makers join countries on car_makers.country = countries.countryid join continents on countries.continent = continents.contid group by continents.continent
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by car_makers.country order by count(*) desc limit 1
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by car_makers.country order by count(*) desc limit 1
select count(*), car_makers.maker from car_makers group by car_makers.maker
select car_makers.id, car_makers.fullname, count(*) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select cars_data.accelerate from car_names join cars_data on car_names.makeid = cars_data.id where car_names.make = "amc" and car_names.hornet = "sw"
select cars_data.accelerate from car_names join cars_data on car_names.makeid = cars_data.id where car_names.make = "amc" and car_names.hornet = "sw"
select count(*) from car_makers join countries on car_makers.country = countries.countryid where countries.countryname = "france"
select count(*) from car_makers join countries on car_makers.country = countries.countryid where countries.countryname = "france"
select count(*) from car_makers join countries on car_makers.country = countries.countryid where countries.countryname = "usa"
select count(*) from model_list join car_names on model_list.modelid = car_names.model where model_list.maker = "United States"
select avg(cars_data.mpg) from cars_data where cars_data.cylinders = 4
select avg(cars_data.mpg) from cars_data where cars_data.cylinders = 4
select min(cars_data.weight) from cars_data where cars_data.cylinders = 8 and cars_data.year = 1974
select min(cars_data.weight) from cars_data where cars_data.year = 1974 and cars_data.cylinders = 8
select * from car_makers join model_list on car_makers.id = model_list.modelid
select car_makers.maker, model_list.model from car_makers join model_list on car_makers.id = model_list.modelid
select countries.countryname, car_makers.country from countries join car_makers on countries.countryid = car_makers.country group by car_makers.country having count(*) >= 1
select countries.countryname, countries.countryid from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count(*) >= 1
select count(*) from cars_data where cars_data.horsepower > 150
select count(*) from cars_data where cars_data.horsepower > 150
select avg(cars_data.weight), cars_data.year from cars_data group by cars_data.year
select avg(cars_data.weight), cars_data.year from cars_data group by cars_data.year
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country where continents.content = "europe" group by car_makers.country having count(*) >= 3
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country where continents.content = "europe" and car_makers.manufacturer = 3
select max(cars_data.horsepower), car_names.make from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.cylinders = 3
select car_names.make, max(cars_data.horsepower) from car_names join model_list on car_names.model = model_list.modelid join cars_data on model_list.id = cars_data.id group by car_names.make
select car_names.model from cars_data join car_names on cars_data.id = car_names.makeid order by cars_data.mpg desc limit 1
select car_names.model from cars_data join car_names on cars_data.id = car_names.makeid order by cars_data.mpg desc limit 1
select avg(cars_data.horsepower) from cars_data where cars_data.year < 1980
select avg(cars_data.horsepower) from cars_data where cars_data.year < 1980
select avg(cars_data.edispl) from cars_data join car_names on cars_data.id = car_names.makeid where car_names.model = "volvo"
select avg(cars_data.edispl) from cars_data where cars_names.model = "volvo"
select cars_data.cylinders, max(cars_data.accelerate) from cars_data group by cars_data.cylinders
select cars_data.cylinders, max(cars_data.accelerate) from cars_data group by cars_data.cylinders
select car_names.model from car_names group by car_names.model order by count(*) desc limit 1
select car_names.model from car_names group by car_names.model order by count(*) desc limit 1
select count(*) from cars_data where cars_data.cylinders > 4
select count(*) from cars_data where cars_data.cylinders > 4
select count(*) from cars_data where cars_data.year = 1980
select count(*) from cars_data where cars_data.year = 1980
select count(*) from car_makers join model_list on car_makers.id = model_list.maker where car_makers.fullname = "American Motor Company"
select count(*) from car_makers join model_list on car_makers.id = model_list.maker where car_makers.fullname = "American Motor Company"
select car_makers.fullname, car_makers.id from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count(*) > 3
select car_makers.fullname, car_makers.id from car_makers join model_list on car_makers.id = model_list.maker group by model_list.maker having count(*) > 3
select distinct car_names.model from car_makers join model_list on car_makers.id = model_list.maker where car_makers.fullname = "General Motors" or cars_data.weight > 3500
select distinct car_names.model from car_makers join model_list on car_makers.id = model_list.modelid join car_names on model_list.maker = car_names.makeid where car_makers.fullname = "General Motors" or cars_data.weight > 3500
select cars_data.year from cars_data where cars_data.accelerate between 3000 and 4000
select cars_data.year from cars_data where cars_data.weight < 4000 intersect select cars_data.year from cars_data where cars_data.weight > 3000
select cars_data.horsepower from cars_data order by cars_data.accelerate desc limit 1
select cars_data.horsepower from cars_data order by cars_data.accelerate desc limit 1
select cars_data.cylinders from cars_data join car_names on cars_data.id = car_names.makeid where car_names.model = "volvo" order by cars_data.accelerate asc limit 1
select cars_data.cylinders from cars_data join car_names on cars_data.id = car_names.makeid where car_names.model = "volvo" order by cars_data.accelerate asc limit 1
select count(*) from cars_data where cars_data.accelerate > (select max(cars_data.horsepower) from cars_data)
select count(*) from cars_data where cars_data.accelerate > (select cars_data.horsepower from cars_data order by count(*) desc limit 1)
select count(*) from countries join car_makers on countries.countryid = car_makers.country group by countries.countryname having count(*) > 2
select count(*) from countries join car_makers on countries.countryid = car_makers.country group by countries.countryname having count(*) > 2
select count(*) from cars_data where cars_data.cylinders > 6
select count(*) from cars_data where cars_data.cylinders > 6
select car_names.model from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.cylinders = 4 order by cars_data.horsepower desc limit 1
select car_names.model from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.cylinders = 4 order by cars_data.horsepower desc limit 1
select car_names.makeid, car_names.make from car_names join cars_data on car_names.makeid = cars_data.id except select car_names.makeid, car_names.make from car_names join cars_data on car_names.makeid = cars_data.id where cars_data.cylinders > 3
select cars_data.id, car_names.make from cars_data except select cars_data.id, car_names.make from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.cylinders < 4
select max(cars_data.mpg) from cars_data where cars_data.cylinders = "8" or cars_data.year < 1980
select max(cars_data.mpg) from cars_data where cars_data.cylinders = "8" or cars_data.year < 1980
select model_list.model from model_list where model_list.weight < 3500 except select model_list.model from model_list join car_names on model_list.model = car_names.model where car_names.fullname = "Ford Motor Company"
select model_list.model from model_list where model_list.weight > 3500 except select model_list.model from car_makers where car_makers.fullname = "Ford Motor Company"
select countries.countryname from countries except select countries.countryname from countries join car_makers on countries.countryid = car_makers.country where car_makers.maker = 1
select countries.countryname from countries where countries.countryid not in (select car_makers.country from car_makers)
select car_makers.id, car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count(*) >= 2 intersect select car_makers.id, car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count(*) > 3
select car_makers.id, car_makers.maker from car_makers group by model_list.maker having count(*) >= 2
select countries.countryid, countries.countryname from countries join car_makers on countries.countryid = car_makers.id group by countries.countryid having count(*) > 3 union select countries.countryid, countries.countryname from countries join car_makers on countries.countryid = car_makers.id where car_makers.maker = "Fiat"
select countries.countryid, countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count(*) > 3 union select countries.countryid, countries.countryname from countries join car_makers on countries.countryid = car_makers.country where car_makers.maker = "Fiat"
select airlines.country from airlines where airlines.airline = "JetBlue Airways"
select airlines.country from airlines where airlines.airline = "JetBlue Airways"
select airlines.abbreviation from airlines where airlines.airline = "JetBlue Airways"
select airlines.abbreviation from airlines where airlines.airline = "JetBlue Airways"
select airlines.airline, airlines.abbreviation from airlines where airlines.country = "USA"
select airlines.airline, airlines.abbreviation from airlines where airlines.country = "USA"
select airports.airportcode, airports.airportname from airports where airports.city = "Anthony"
select airports.airportcode, airports.airportname from airports where airports.city = "Anthony"
select count(*) from airlines
select count(*) from airlines
select count(*) from airports
select count(*) from airports
select count(*) from flights
select count(*) from flights
select airlines.airline from airlines where airlines.abbreviation = "UAL"
select airlines.airline from airlines where airlines.abbreviation = "UAL"
select count(*) from airlines where airlines.country = "USA"
select count(*) from airlines where airlines.country = "USA"
select airports.city, airports.country from airports where airports.airportname = "Alton"
select airports.city, airports.country from airports where airports.airportname = "Alton"
select airports.airportname from airports where airports.airportcode = "AKO"
select airports.airportname from airports where airports.airportcode = "AKO"
select airports.airportname from airports where airports.city = "Aberdeen"
select airports.airportname from airports where airports.city = "Aberdeen"
select count(*) from flights where flights.sourceairport = "APG"
select count(*) from flights where flights.sourceairport = "APG"
select count(*) from flights where flights.destairport = "ATO"
select count(*) from flights join airports on flights.airportcode = airports.airportcode where airports.airportcode = "ATO"
select count(*) from flights join airports on flights.sourceairport = airports.airportcode where airports.city = "Aberdeen"
select count(*) from flights join airports on flights.sourceairport = airports.airportcode where airports.city = "Aberdeen"
select count(*) from flights join airports on flights.destairport = airports.airportcode where airports.city = "Aberdeen"
select count(*) from flights join airports on flights.sourceairport = airports.airportcode where airports.city = "Aberdeen"
select count(*) from flights where airports.city = "Aberdeen" and airports.destination = "Ashley"
select count(*) from flights where flights.sourceairport = "Aberdeen" and flights.destairport = "Ashley"
select count(*) from flights join airlines on flights.airline = airlines.uid where airlines.airline = "JetBlue Airways"
select count(*) from flights join airlines on flights.airline = airlines.uid where airlines.airline = "JetBlue Airways"
select count(*) from airlines join flights on airlines.uid = flights.airline where airlines.airline = "United Airlines" and airports.airportcode = "ASY"
select count(*) from airlines join flights on airlines.airline = flights.airline where airlines.airline = "United Airlines" and airports.airportcode = "ASY"
select count(*) from airlines join flights on airlines.uid = flights.airline where airlines.airline = "United Airlines" and flights.sourceairport = "AHD"
select count(*) from airlines join flights on airlines.uid = flights.airline where airlines.airline = "United Airlines" and flights.sourceairport = "AHD"
select count(*) from flights join airports on flights.sourceairport = airports.airportcode join airlines on flights.destairport = airlines.uid where airports.city = "Aberdeen" and airlines.airline = "United Airlines"
select count(*) from airlines join flights on airlines.uid = flights.airline where airlines.airline = "United Airlines" and airports.city = "Aberdeen"
select airports.city from flights join airports on flights.sourceairport = airports.airportcode group by airports.city order by count(*) desc limit 1
select airports.city from flights join airports on flights.destairport = airports.airportcode group by airports.city order by count(*) desc limit 1
select airports.city from flights join airports on flights.sourceairport = airports.airportcode group by airports.city order by count(*) desc limit 1
select airports.city from airports group by airports.city order by count(*) desc limit 1
select airports.airportcode from flights join airports on flights.sourceairport = airports.airportcode group by airports.airportcode order by count(*) desc limit 1
select airports.airportcode from airports join flights on airports.airportcode = flights.sourceairport group by airports.airportcode order by count(*) desc limit 1
select airports.airportcode from flights join airports on flights.sourceairport = airports.airportcode group by airports.airportcode order by count(*) asc limit 1
select airports.airportcode from airports join flights on airports.airportcode = flights.sourceairport group by flights.sourceairport order by count(*) asc limit 1
select airlines.airline from flights join airlines on flights.airline = airlines.uid group by airlines.airline order by count(*) desc limit 1
select airlines.airline from flights join airlines on flights.airline = airlines.uid group by flights.airline order by count(*) desc limit 1
select airlines.abbreviation, airlines.country from airlines join flights on airlines.uid = flights.airline group by flights.airline order by count(*) asc limit 1
select airlines.abbreviation, airlines.country from airlines join flights on airlines.airline = flights.airline group by flights.airline order by count(*) asc limit 1
select airlines.abbreviation from flights join airlines on flights.airline = airlines.uid where flights.sourceairport = "AHD"
select distinct airlines.airline from airlines join flights on airlines.uid = flights.airline where flights.sourceairport = "AHD"
select distinct airlines.airline from airlines join flights on airlines.uid = flights.airline where airports.airportcode = "AHD"
select distinct airlines.airline from airlines join flights on airlines.uid = flights.airline where flights.destairport = "AHD"
select airlines.airline from airlines join flights on airlines.uid = flights.airline where airports.airportname = "APG" intersect select airlines.airline from airlines join flights on airlines.uid = flights.airline where airports.airportname = "CVO"
select airlines.airline from airlines join flights on airlines.uid = flights.airline where flights.sourceairport = "APG" intersect select flights.airline from airlines join flights on airlines.uid = flights.airline where airports.airportcode = "CVB"
select airlines.airline from airlines join flights on airlines.uid = flights.airline where airports.airportcode = "CVO" except select airlines.airline from airlines join flights on airlines.uid = flights.airline where airports.airportcode = "APG"
select airlines.airline from airlines where airlines.abbreviation = "CVO" except select airlines.airline from airlines where airports.airportcode = "APG"
select distinct airlines.airline from flights join airlines on flights.airline = airlines.uid group by flights.airline having count(*) >= 10
select distinct airlines.airline from flights join airlines on flights.airline = airlines.uid group by flights.airline having count(*) >= 10
select distinct airlines.airline from flights join airlines on flights.airline = airlines.uid group by flights.airline having count(*) < 200
select distinct airlines.airline from flights join airlines on flights.airline = airlines.uid group by flights.airline having count(*) < 200
select flights.flightno from flights join airlines on flights.airline = airlines.uid where airlines.airline = "United Airlines"
select flights.flightno from flights join airlines on flights.airline = airlines.uid where airlines.airline = "United Airlines"
select flights.flightno from flights join airports on flights.destairport = airports.airportcode where airports.airportcode = "APG"
select flights.flightno from flights where flights.sourceairport = "APG"
select flights.flightno from flights join airports on flights.sourceairport = airports.airportcode where airports.airportcode = "APG"
select flights.flightno from flights where flights.sourceairport = "APG"
select flights.flightno from flights join airports on flights.sourceairport = airports.airportcode where airports.city = "Aberdeen"
select flights.flightno from flights join airports on flights.sourceairport = airports.airportcode where airports.city = "Aberdeen"
select flights.flightno from flights join airports on flights.destairport = airports.airportcode where airports.city = "Aberdeen"
select flights.flightno from flights join airports on flights.destairport = airports.airportcode where airports.city = "Aberdeen"
select count(*) from flights join airports on flights.destairport = airports.airportcode where airports.city = "Aberdeen" or airports.city = "Abilene"
select count(*) from flights join airports on flights.destairport = airports.airportcode where airports.city = "Aberdeen" or airports.city = "Abilene"
select airports.airportname from airports where airports.airportcode not in (select flights.destairport from flights)
select airports.airportname from airports except select airports.airportname from flights join airports on flights.airport = airports.airportcode
select count(*) from employee
select count(*) from employee
select employee.name from employee order by employee.age asc
select employee.name from employee order by employee.age asc
select count(*), employee.city from employee group by employee.city
select count(*), employee.city from employee group by employee.city
select employee.city from employee where employee.age < 30 group by employee.city having count(*) > 1
select employee.city from employee where employee.age < 30 group by employee.city having count(*) > 1
select count(*), shop.location from shop group by shop.location
select count(*), shop.location from shop group by shop.location
select shop.manager_name, shop.district from shop order by shop.number_products desc limit 1
select shop.manager_name, shop.district from shop order by shop.number_products desc limit 1
select min(shop.number_products), max(shop.number_products) from shop
select min(shop.number_products), max(shop.number_products) from shop
select shop.name, shop.location, shop.district from shop order by shop.number_products desc
select shop.name, shop.location, shop.district from shop order by shop.number_products desc
select shop.name from shop where shop.number_products > (select avg(shop.number_products) from shop)
select shop.name from shop where shop.number_products > (select avg(shop.number_products) from shop)
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id group by evaluation.employee_id order by count(*) desc limit 1
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id group by evaluation.employee_id order by count(*) desc limit 1
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id order by evaluation.bonus desc limit 1
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id order by evaluation.bonus desc limit 1
select employee.name from employee where employee.employee_id not in (select evaluation.employee_id from evaluation)
select employee.name from employee where employee.employee_id not in (select evaluation.employee_id from evaluation)
select shop.name from hiring join shop on hiring.shop_id = shop.shop_id group by hiring.shop_id order by count(*) desc limit 1
select shop.name from hiring join shop on hiring.shop_id = shop.shop_id group by hiring.shop_id order by count(*) desc limit 1
select shop.name from shop where shop.shop_id not in (select hiring.shop_id from hiring)
select shop.name from shop where shop.shop_id not in (select hiring.shop_id from hiring)
select count(*), shop.name from shop join hiring on shop.shop_id = hiring.shop_id group by hiring.shop_id
select count(*), shop.name from hiring join shop on hiring.shop_id = shop.shop_id group by shop.name
select sum(evaluation.bonus) from evaluation
select sum(evaluation.bonus) from evaluation
select * from hiring
select * from hiring
select shop.district from shop where shop.number_products < 3000 intersect select shop.district from shop where shop.number_products > 10000
select shop.district from shop where shop.number_products < 3000 intersect select shop.district from shop where shop.number_products > 10000
select count(distinct shop.location) from shop
select count(distinct shop.location) from shop
select count(*) from documents
select count(*) from documents
select documents.document_id, documents.document_name, documents.document_description from documents
select documents.document_id, documents.document_name, documents.document_description from documents
select documents.document_name, documents.template_id from documents where documents.document_description like "%w%"
select documents.document_name, documents.template_id from documents where documents.document_description like "%w%"
select documents.document_id, documents.template_id, documents.document_description from documents where documents.document_name = "Robbin CV"
select documents.document_id, documents.template_id, documents.document_description from documents where documents.document_name = "Robbin CV"
select count(distinct documents.template_id) from documents
select count(distinct documents.template_id) from documents
select count(*) from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = "PPT"
select count(*) from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = "PPT"
select documents.template_id, count(*) from documents group by documents.template_id
select documents.template_id, count(*) from documents group by documents.template_id
select templates.template_id, templates.template_type_code from documents join templates on documents.template_id = templates.template_id group by documents.template_id order by count(*) desc limit 1
select templates.template_id, templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by documents.template_id order by count(*) desc limit 1
select documents.template_id from documents group by documents.template_id having count(*) > 1
select documents.template_id from documents group by documents.template_id having count(*) > 1
select templates.template_id from templates except select documents.template_id from documents
select templates.template_id from templates except select documents.template_id from documents
select count(*) from templates
select count(*) from templates
select templates.template_id, templates.version_number, templates.template_type_code from templates
select templates.template_id, templates.version_number, templates.template_type_code from templates
select distinct templates.template_type_code from templates
select distinct templates.template_type_code from templates
select templates.template_id from templates where templates.template_type_code = "PP" or templates.template_type_code = "PPT"
select templates.template_id from templates where templates.template_type_code = "PP" or templates.template_type_code = "PPT"
select count(*) from templates where templates.template_type_code = "CV"
select count(*) from templates where templates.template_type_code = "CV"
select templates.version_number, templates.template_type_code from templates where templates.version_number > 5
select templates.version_number, templates.template_type_code from templates where templates.version_number > 5
select templates.template_type_code, count(*) from templates group by templates.template_type_code
select templates.template_type_code, count(*) from templates group by templates.template_type_code
select templates.template_type_code from templates group by templates.template_type_code order by count(*) desc limit 1
select templates.template_type_code from templates group by templates.template_type_code order by count(*) desc limit 1
select templates.template_type_code from templates group by templates.template_type_code having count(*) < 3
select templates.template_type_code from templates group by templates.template_type_code having count(*) < 3
select templates.version_number, templates.template_type_code from templates order by templates.version_number asc limit 1
select templates.version_number, templates.template_type_code from templates order by templates.version_number asc limit 1
select templates.template_type_code from documents join templates on documents.template_id = templates.template_id where documents.document_name = "Data base"
select templates.template_type_code from documents join templates on documents.template_id = templates.template_id where documents.document_name = "Data base"
select documents.document_name from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = "BK"
select documents.document_name from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = "BK"
select templates.template_type_code, count(*) from documents join templates on documents.template_id = templates.template_id group by templates.template_type_code
select templates.template_type_code, count(*) from documents join templates on documents.template_id = templates.template_id group by templates.template_type_code
select templates.template_type_code from documents join templates on documents.template_id = templates.template_id group by templates.template_type_code order by count(*) desc limit 1
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_type_code order by count(*) desc limit 1
select templates.template_type_code from templates except select templates.template_type_code from templates join documents on templates.template_id = documents.template_id
select templates.template_type_code from templates except select templates.template_type_code from templates join documents on templates.template_id = documents.template_id
select ref_template_types.template_type_code, ref_template_types.template_type_description from ref_template_types
select ref_template_types.template_type_code, ref_template_types.template_type_description from ref_template_types
select ref_template_types.template_type_description from ref_template_types where ref_template_types.template_type_code = "AD"
select ref_template_types.template_type_description from ref_template_types where ref_template_types.template_type_code = "AD"
select ref_template_types.template_type_code from ref_template_types where ref_template_types.template_type_description = "Book"
select ref_template_types.template_type_code from ref_template_types where ref_template_types.template_type_description = "Book"
select distinct ref_template_types.template_type_description from ref_template_types join templates on ref_template_types.template_type_code = templates.template_type_code join documents on templates.template_id = documents.template_id
select distinct ref_template_types.template_type_description from ref_template_types where ref_template_types.template_type_code in (select documents.template_id from documents)
select templates.template_id from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code where ref_template_types.template_type_description = "Presentation"
select templates.template_id from ref_template_types join templates on ref_template_types.template_type_code = templates.template_type_code where ref_template_types.template_type_description = "Presentation"
select count(*) from paragraphs
select count(*) from paragraphs
select count(*) from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = "Summer Show"
select count(*) from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = "Summer Show"
select paragraphs.template_details from paragraphs where paragraphs.paragraph_text = "Korea"
select paragraphs.other_details from paragraphs where paragraphs.paragraph_text like "%Korea%"
select paragraphs.paragraph_id, paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = "Welcome to NY"
select paragraphs.paragraph_id, paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = "Welcome to NY"
select paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = "Customer reviews"
select paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = "Customer reviews"
select paragraphs.document_id, count(*) from paragraphs group by paragraphs.document_id order by paragraphs.document_id asc
select paragraphs.document_id, count(*) from paragraphs group by paragraphs.document_id order by paragraphs.document_id asc
select documents.document_id, documents.document_name, count(*) from documents join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id
select documents.document_id, documents.document_name, count(*) from documents join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id
select paragraphs.document_id from paragraphs group by paragraphs.document_id having count(*) >= 2
select paragraphs.document_id from paragraphs group by paragraphs.document_id having count(*) >= 2
select documents.document_id, documents.document_name from documents join paragraphs on documents.document_id = paragraphs.document_id group by paragraphs.document_id order by count(*) desc limit 1
select documents.document_id, documents.document_name from documents join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id order by count(*) desc limit 1
select paragraphs.document_id from paragraphs group by paragraphs.document_id order by count(*) asc limit 1
select paragraphs.document_id from paragraphs group by paragraphs.document_id order by count(*) asc limit 1
select paragraphs.document_id from paragraphs group by paragraphs.document_id having count(*) between 1 and 2
select paragraphs.document_id from paragraphs group by paragraphs.document_id having count(*) between 1 and 2
select paragraphs.document_id from paragraphs where paragraphs.paragraph_text = "Brazil" intersect select paragraphs.document_id from paragraphs where paragraphs.paragraph_text = "Ireland"
select documents.document_id from documents join paragraphs on documents.document_id = paragraphs.document_id where paragraphs.paragraph_text = "Brazil" and paragraphs.paragraph_text = "Ireland"
select count(*) from teacher
select count(*) from teacher
select teacher.name from teacher order by teacher.age asc
select teacher.name from teacher order by teacher.age asc
select teacher.age, teacher.hometown from teacher
select teacher.age, teacher.hometown from teacher
select teacher.name from teacher where teacher.hometown!= "Little Lever Urban District"
select teacher.name from teacher where teacher.hometown!= "Little Lever Urban District"
select teacher.name from teacher where teacher.age = 32 or teacher.age = 33
select teacher.name from teacher where teacher.age = 32 or teacher.age = 33
select teacher.hometown from teacher order by teacher.age asc limit 1
select teacher.name from teacher order by teacher.age desc limit 1
select teacher.hometown, count(*) from teacher group by teacher.hometown
select teacher.hometown, count(*) from teacher group by teacher.hometown
select teacher.hometown from teacher group by teacher.hometown order by count(*) desc limit 1
select teacher.hometown from teacher group by teacher.hometown order by count(*) desc limit 1
select teacher.hometown from teacher group by teacher.hometown having count(*) >= 2
select teacher.hometown from teacher group by teacher.hometown having count(*) >= 2
select teacher.name, course.course from course_arrange join course on course_arrange.course_id = course.course_id join teacher on course_arrange.teacher_id = teacher.teacher_id
select teacher.name, course.course from course join course_arrange on course.course_id = course_arrange.course_id join teacher on course_arrange.teacher_id = teacher.teacher_id
select teacher.name, course.course from course join course_arrange on course.course_id = course_arrange.course_id join teacher on course_arrange.teacher_id = teacher.teacher_id order by teacher.name asc
select teacher.name, course.course from course join course_arrange on course.course_id = course_arrange.course_id join teacher on course_arrange.teacher_id = teacher.teacher_id order by teacher.name asc
select teacher.name from course join teacher on course.teacher_id = teacher.teacher_id where course.course = "Math"
select teacher.name from course join teacher on course.course_id = teacher.teacher_id where course.course = "Math"
select teacher.name, count(*) from course join teacher on course.teacher_id = teacher.teacher_id group by teacher.name
select teacher.name, count(*) from course join teacher on course.teacher_id = teacher.teacher_id group by teacher.name
select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by teacher.name having count(*) >= 2
select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by teacher.name having count(*) >= 2
select teacher.name from teacher where teacher.teacher_id not in (select course_arrange.teacher_id from course_arrange)
select teacher.name from teacher where teacher.teacher_id not in (select course_arrange.teacher_id from course_arrange)
select count(*) from visitor where visitor.age < 30
select visitor.name from visitor where visitor.level_of_membership > 4 order by visitor.level_of_membership desc
select avg(visitor.age) from visitor where visitor.level_of_membership <= 4
select visitor.name, visitor.level_of_membership from visitor where visitor.level_of_membership > 4 order by visitor.age desc
select museum.museum_id, museum.name from museum order by museum.num_of_staff desc limit 1
select avg(museum.num_of_staff) from museum where museum.open_year < 2009
select museum.open_year, museum.num_of_staff from museum where museum.name = "Plaza Museum"
select museum.name from museum where museum.num_of_staff > (select min(museum.num_of_staff) from museum where museum.open_year > 2010)
select visitor.id, visitor.name, visitor.age from visitor join visit on visitor.id = visit.visitor_id group by visitor.id having count(*) > 1
select visitor.id, visitor.name, visitor.level_of_membership from visitor join visit on visitor.id = visit.visitor_id where visit.total_spent = (select max(visit.total_spent) from visit)
select visit.museum_id, museum.name from visit join museum on visit.museum_id = museum.museum_id group by visit.museum_id order by count(*) desc limit 1
select museum.name from museum where museum.museum_id not in (select visit.museum_id from visit)
select visitor.name, visitor.age from visitor join visit on visitor.id = visit.visitor_id group by visitor.id order by count(*) desc limit 1
select avg(visit.num_of_ticket), max(visit.num_of_ticket) from visit
select sum(visit.total_spent) from visitor join visit on visitor.id = visit.visitor_id where visitor.level_of_membership = 1
select visitor.name from visitor join visit on visitor.id = visit.visitor_id join museum on visit.museum_id = museum.museum_id where museum.open_year < 2009 intersect select visitor.name from visitor join visit on visitor.id = visit.visitor_id join museum on visit.museum_id = museum.museum_id where museum.open_year > 2011
select count(distinct visit.visitor_id) from visit where visit.museum_id not in (select museum.museum_id from museum where museum.open_year > 2010)
select count(*) from museum where museum.open_year > 2013 or museum.open_year < 2008
select count(*) from players
select count(*) from players
select count(*) from matches
select count(*) from matches
select players.first_name, players.birth_date from players where players.country_code = "USA"
select players.first_name, players.birth_date from players where players.country_code = "USA"
select avg(matches.loser_age), avg(matches.winner_age) from matches
select avg(matches.loser_age), avg(matches.winner_age) from matches
select avg(matches.winner_rank) from matches
select avg(matches.winner_rank) from matches
select min(matches.loser_rank) from matches
select min(matches.loser_rank) from matches
select count(distinct players.country_code) from players
select count(distinct players.country_code) from players
select count(distinct matches.loser_name) from matches
select count(distinct matches.loser_name) from matches
select matches.tourney_name from matches group by matches.tourney_name having count(*) > 10
select matches.tourney_name from matches group by matches.tourney_name having count(*) > 10
select matches.winner_name from matches where matches.year = 2013 intersect select matches.winner_name from matches where matches.year = 2016
select players.first_name, players.last_name from players join matches on players.player_id = matches.winner_id where matches.year = 2013 intersect select players.first_name, players.last_name from players join matches on players.player_id = matches.winner_id where matches.year = 2016
select count(*) from matches where matches.year = 2013 or matches.year = 2016
select count(*) from matches where matches.year = 2013 or matches.year = 2016
select players.country_code, players.first_name from players join matches on players.player_id = matches.winner_id where matches.tourney_name = "WTA Championships" intersect select players.country_code, players.first_name from players join matches on players.player_id = matches.winner_id where matches.tourney_name = "Australian Open"
select players.first_name, players.country_code from players join matches on players.player_id = matches.winner_id where matches.tourney_name = "WTA Championships" intersect select players.first_name, players.country_code from players join matches on players.player_id = matches.winner_id where matches.tourney_name = "Australian Open"
select players.first_name, players.country_code from players order by players.birth_date asc limit 1
select players.first_name, players.country_code from players order by players.birth_date asc limit 1
select players.first_name, players.last_name from players order by players.birth_date asc
select players.first_name, players.last_name from players order by players.birth_date asc
select players.first_name, players.last_name from players where players.hand = "L" order by players.birth_date asc
select players.first_name, players.last_name from players order by players.birth_date asc
select players.first_name, players.country_code from players join rankings on players.player_id = rankings.player_id group by players.first_name, players.country_code order by count(*) desc limit 1
select players.first_name, players.country_code from players join rankings on players.player_id = rankings.player_id order by rankings.tours desc limit 1
select matches.year from matches group by matches.year order by count(*) desc limit 1
select matches.year from matches group by matches.year order by count(*) desc limit 1
select matches.winner_name, matches.winner_rank_points from matches group by matches.winner_name order by count(*) desc limit 1
select matches.winner_name, matches.winner_rank_points from matches group by matches.winner_id order by count(*) desc limit 1
select matches.winner_name from matches where matches.tourney_name = "Australian Open" order by matches.winner_rank_points desc limit 1
select matches.winner_name from matches where matches.tourney_name = "Australian Open" order by matches.winner_rank_points desc limit 1
select matches.loser_name, matches.winner_name from matches order by matches.minutes desc limit 1
select matches.winner_name, matches.loser_name from matches order by matches.minutes desc limit 1
select players.first_name, avg(rankings.ranking) from rankings join players on rankings.player_id = players.player_id group by players.first_name
select players.first_name, avg(rankings.ranking) from players join rankings on players.player_id = rankings.player_id group by players.first_name
select sum(rankings.ranking_points), players.first_name from players join rankings on players.player_id = rankings.player_id group by players.first_name
select players.first_name, sum(rankings.ranking_points) from players join rankings on players.player_id = rankings.player_id group by players.first_name
select count(*), players.country_code from players group by players.country_code
select count(*), players.country_code from players group by players.country_code
select players.country_code from players group by players.country_code order by count(*) desc limit 1
select players.country_code from players group by players.country_code order by count(*) desc limit 1
select players.country_code from players group by players.country_code having count(*) > 50
select players.country_code from players group by players.country_code having count(*) > 50
select rankings.ranking_date, sum(rankings.tours) from rankings group by rankings.ranking_date
select rankings.ranking_date, sum(rankings.tours) from rankings group by rankings.ranking_date
select count(*), matches.year from matches group by matches.year
select count(*), matches.year from matches group by matches.year
select matches.winner_name, matches.winner_rank from matches order by matches.winner_age asc limit 3
select matches.winner_name, matches.winner_rank from matches order by matches.winner_age asc limit 3
select count(distinct matches.winner_id) from matches where matches.tourney_name = "WTA Championships"
select count(*) from matches join players on matches.player_id = players.player_id where players.tourney_name = "WTA Championships"
select players.first_name, players.country_code, players.birth_date from players join matches on players.player_id = matches.winner_id order by matches.winner_rank_points desc limit 1
select players.first_name, players.country_code, players.birth_date from players join matches on players.player_id = matches.winner_id order by matches.winner_rank_points desc limit 1
select players.hand, count(*) from players group by players.hand
select players.hand, count(*) from players group by players.hand
select count(*) from ship where ship.disposition_of_ship = "Captured"
select ship.name, ship.tonnage from ship order by ship.name desc
select battle.name, battle.date, battle.result from battle
select max(death.killed), min(death.killed) from death
select avg(death.injured) from death
select death.death, death.injured from death join ship on death.caused_by_ship_id = ship.id where ship.tonnage = "t"
select battle.name, battle.result from battle where battle.bulgarian_commander != "Boril"
select distinct battle.id, battle.name from battle join ship on battle.id = ship.lost_in_battle where ship.ship_type = "Brig"
select battle.id, battle.name from death join battle on death.id = battle.id where death.killed > 10
select ship.id, ship.name from death join ship on death.caused_by_ship_id = ship.id group by death.caused_by_ship_id order by sum(death.injured) desc limit 1
select distinct battle.name from battle where battle.bulgarian_commander = "Kaloyan" and battle.latin_commander = "Baldwin I"
select count(distinct battle.result) from battle
select count(*) from battle where battle.id not in (select ship.lost_in_battle from ship where ship.tonnage = 225)
select battle.name, battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name = "Lettice" intersect select battle.name, battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name = "HMS Atalanta"
select battle.name, battle.result, battle.bulgarian_commander from battle except select battle.name, battle.result, battle.bulgarian_commander from battle join ship on battle.id = ship.lost_in_battle where ship.location = "English Channel"
select death.note from death where death.note like "%East%"
select addresses.line_1, addresses.line_2 from addresses
select addresses.line_1, addresses.line_2 from addresses
select count(*) from courses
select count(*) from courses
select courses.course_description from courses where courses.course_name = "math"
select courses.course_description from courses where courses.course_name = "math"
select addresses.zip_postcode from addresses where addresses.city = "Port Chelsea"
select addresses.zip_postcode from addresses where addresses.city = "Port Chelsea"
select departments.department_name, degree_programs.department_id from degree_programs join departments on degree_programs.department_id = departments.department_id group by degree_programs.department_id order by count(*) desc limit 1
select departments.department_name, degree_programs.department_id from degree_programs join departments on degree_programs.department_id = departments.department_id group by degree_programs.department_id order by count(*) desc limit 1
select count(distinct degree_programs.department_id) from degree_programs
select count(distinct degree_programs.department_id) from degree_programs
select count(distinct degree_programs.degree_summary_name) from degree_programs
select count(distinct degree_programs.degree_summary_name) from degree_programs
select count(*) from degree_programs join departments on degree_programs.department_id = departments.department_id where departments.department_name = "engineering"
select count(*) from degree_programs join departments on degree_programs.department_id = departments.department_id where departments.department_name = "engineering"
select sections.section_name, sections.section_description from sections
select sections.section_name, sections.section_description from sections
select courses.course_name, courses.course_id from courses join sections on courses.course_id = sections.course_id group by sections.course_id having count(*) <= 2
select courses.course_name, courses.course_id from courses join sections on courses.course_id = sections.course_id group by courses.course_id having count(*) < 2
select sections.section_name from sections order by sections.section_name desc
select sections.section_name from sections order by sections.section_name desc
select semesters.semester_name, semesters.semester_id from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id group by semesters.semester_id order by count(*) desc limit 1
select semesters.semester_name, semesters.semester_id from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id group by semesters.semester_id order by count(*) desc limit 1
select departments.department_description from departments where departments.department_name like "%computer%"
select departments.department_description from departments where departments.department_name like "%computer%"
select students.first_name, students.middle_name, students.last_name, students.student_id from student_enrolment join students on student_enrolment.student_id = students.student_id group by students.student_id having count(*) = 2
select students.first_name, students.middle_name, students.last_name, student_enrolment.student_id from student_enrolment join students on student_enrolment.student_id = students.student_id join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id group by student_enrolment.student_id having count(*) = 2
select students.first_name, students.middle_name, students.last_name from students join student_enrolment on students.student_id = student_enrolment.student_id join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id where degree_programs.degree_summary_name = "Bachelor"
select student_enrolment.first_name, student_enrolment.middle_name, student_enrolment.last_name from student_enrolment join students on student_enrolment.student_id = students.student_id where student_enrolment.student_program_id = "Bachelors"
select student_enrolment.degree_program_id from student_enrolment group by student_enrolment.degree_program_id order by count(*) desc limit 1
select degree_programs.degree_summary_name from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id group by degree_programs.degree_summary_name order by count(*) desc limit 1
select student_enrolment.student_program_id, degree_programs.degree_summary_name from student_enrolment join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id group by student_enrolment.student_program_id order by count(*) desc limit 1
select student_enrolment.degree_program_id, degree_programs.degree_summary_name from student_enrolment join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id group by student_enrolment.degree_program_id order by count(*) desc limit 1
select student_enrolment.student_id, students.first_name, students.middle_name, students.last_name, count(*) from student_enrolment join students on student_enrolment.student_id = students.student_id group by student_enrolment.student_id order by count(*) desc limit 1
select students.first_name, students.middle_name, students.last_name, student_enrolment.student_enrolment_id, count(*) from student_enrolment join students on student_enrolment.student_id = students.student_id group by student_enrolment.student_id order by count(*) desc limit 1
select semesters.semester_name from semesters where semesters.semester_id not in (select student_enrolment.semester_id from student_enrolment)
select semesters.semester_name from semesters where semesters.semester_id not in (select student_enrolment.semester_id from student_enrolment)
select distinct courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id
select distinct courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id
select courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id group by courses.course_name order by count(*) desc limit 1
select courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id group by courses.course_name order by count(*) desc limit 1
select students.last_name from students where students.permanent_address_id not in (select addresses.address_id from addresses where addresses.state_province_county = "North Carolina")
select students.last_name from addresses join student_enrolment on addresses.address_id = student_enrolment.address_id where addresses.state_province_county = "North Carolina" except select students.last_name from addresses join student_enrolment on addresses.address_id = student_enrolment.address_id where student_enrolment.degree_program_id = "N"
select transcripts.transcript_id, transcripts.transcript_date from transcripts join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcripts.transcript_id having count(*) >= 2
select transcripts.transcript_date, transcripts.transcript_id from transcripts group by transcripts.transcript_date having count(*) >= 2
select students.cell_mobile_number from students where students.first_name = "Timmothy" and students.last_name = "Ward"
select students.other_student_details from students where students.first_name = "Timmothy" and students.last_name = "Ward"
select students.first_name, students.middle_name, students.last_name from students order by students.date_first_registered asc limit 1
select students.first_name, students.middle_name, students.last_name from students order by students.date_first_registered asc limit 1
select students.first_name, students.middle_name, students.last_name from students order by students.date_left asc limit 1
select students.first_name, students.middle_name, students.last_name from students order by students.ssn asc limit 1
select addresses.first_name from addresses join students on addresses.address_id = students.permanent_address_id where addresses.address_id!= (select distinct students.current_address_id from students)
select students.first_name from students where students.permanent_address_id!= (select max(students.permanent_address_id) from students)
select addresses.address_id, addresses.line_1 from addresses join students on addresses.address_id = students.current_address_id group by addresses.address_id order by count(*) desc limit 1
select addresses.address_id, addresses.line_1, addresses.line_2 from addresses join students on addresses.address_id = students.permanent_address_id group by addresses.address_id order by count(*) desc limit 1
select avg(transcripts.transcript_date) from transcripts
select avg(transcripts.transcript_date) from transcripts
select transcripts.transcript_date, transcripts.other_details from transcripts order by transcripts.transcript_date asc limit 1
select transcripts.transcript_date, transcripts.other_details from transcripts order by transcripts.transcript_date asc limit 1
select count(*) from transcripts
select count(*) from transcripts
select transcripts.transcript_date from transcripts order by transcripts.transcript_date desc limit 1
select transcripts.transcript_date from transcripts order by transcripts.transcript_date desc limit 1
select transcripts.course_enrolment_id, count(*) from transcripts group by transcripts.course_enrolment_id order by count(*) desc limit 1
select transcripts.transcript_id, count(*) from transcripts group by transcripts.transcript_id order by count(*) desc limit 1
select transcripts.transcript_id, transcripts.transcript_date from transcripts join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcripts.transcript_id order by count(*) asc limit 1
select transcripts.transcript_id, transcripts.transcript_date from transcripts join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcripts.transcript_id order by count(*) asc limit 1
select semesters.semester_name from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id where student_enrolment.student_id = Master intersect select semesters.semester_name from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id where student_enrolment.student_id = Bachelor
select semesters.semester_name from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id where semesters.semester_name = "Masters" intersect select semesters.semester_name from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id where semesters.semester_name = "Bachelors"
select count(distinct students.current_address_id) from students
select count(distinct students.current_address_id) from students
select students.other_student_details from students order by students.other_student_details desc
select student_enrolment.other_details from student_enrolment join students on student_enrolment.student_id = students.student_id order by student_enrolment.other_details desc
select sections.section_description from sections where sections.section_name = "h"
select sections.section_description from sections where sections.section_name = "h"
select students.first_name from addresses join students on addresses.address_id = students.permanent_address_id where addresses.country = "Haiti" or students.cell_mobile_number = 09700166582
select students.first_name from addresses join students on addresses.address_id = students.permanent_address_id where addresses.country = "Haiti" or students.cell_mobile_number = 09700166582
select cartoon.title from cartoon order by cartoon.title asc
select cartoon.title from cartoon order by cartoon.title asc
select cartoon.title from cartoon where cartoon.directed_by = "Ben Jones"
select cartoon.title from cartoon where cartoon.directed_by = "Ben Jones"
select count(*) from cartoon where cartoon.written_by = "Joseph Kuhr"
select count(*) from cartoon where cartoon.written_by = "Joseph Kuhr"
select cartoon.title, cartoon.directed_by from cartoon order by cartoon.original_air_date asc
select cartoon.title, cartoon.directed_by from cartoon order by cartoon.original_air_date asc
select cartoon.title from cartoon where cartoon.directed_by = "Ben Jones" or cartoon.directed_by = "Brandon Vietti"
select cartoon.title from cartoon where cartoon.directed_by = "Ben Jones" or cartoon.directed_by = "Brandon Vietti"
select tv_channel.country, count(*) from tv_channel group by tv_channel.country order by count(*) desc limit 1
select tv_channel.country, count(*) from tv_channel group by tv_channel.country order by count(*) desc limit 1
select count(distinct tv_channel.series_name), count(distinct tv_channel.content) from tv_channel
select count(distinct tv_channel.series_name), tv_channel.content from tv_channel
select tv_channel.content from tv_channel where tv_channel.series_name = "Sky Radio"
select tv_channel.content from tv_channel where tv_channel.series_name = "Sky Radio"
select tv_channel.package_option from tv_channel where tv_channel.series_name = "Sky Radio"
select tv_channel.package_option from tv_channel where tv_channel.series_name = "Sky Radio"
select count(*) from tv_channel where tv_channel.language = "English"
select count(*) from tv_channel where tv_channel.language = "English"
select tv_channel.language, count(*) from tv_channel group by tv_channel.language order by count(*) asc limit 1
select tv_channel.language, count(*) from tv_channel group by tv_channel.language order by count(*) asc limit 1
select tv_channel.language, count(*) from tv_channel group by tv_channel.language
select tv_channel.language, count(*) from tv_channel group by tv_channel.language
select tv_channel.series_name from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.title = "The Rise of the Blue Beetle!"
select tv_channel.series_name from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.title = "The Rise of the Blue Beetle!"
select cartoon.title from tv_channel join cartoon on tv_channel.id = cartoon.channel where tv_channel.series_name = "Sky Radio"
select cartoon.title from tv_channel join cartoon on tv_channel.id = cartoon.channel where tv_channel.series_name = "Sky Radio"
select tv_series.episode from tv_series order by tv_series.rating asc
select tv_series.episode from tv_series order by tv_series.rating asc
select tv_series.episode, tv_series.rating from tv_series order by tv_series.rating desc limit 3
select tv_series.episode, tv_series.rating from tv_series order by tv_series.rating desc limit 3
select min(tv_series.share), max(tv_series.share) from tv_series
select max(tv_series.share), min(tv_series.share) from tv_series
select tv_series.air_date from tv_series where tv_series.episode = "A Love of a Lifetime"
select tv_series.air_date from tv_series where tv_series.episode = "A Love of a Lifetime"
select tv_series.weekly_rank from tv_series where tv_series.episode = "A Love of a Lifetime"
select tv_series.weekly_rank from tv_series where tv_series.episode = "A Love of a Lifetime"
select tv_channel.series_name from tv_channel join tv_series on tv_channel.id = tv_series.channel where tv_series.episode = "A Love of a Lifetime"
select tv_channel.series_name from tv_series join tv_channel on tv_series.channel = tv_channel.id where tv_series.episode = "A Love of a Lifetime"
select tv_series.episode from tv_channel join tv_series on tv_channel.id = tv_series.channel where tv_channel.series_name = "Sky Radio"
select tv_series.episode from tv_channel join tv_series on tv_channel.id = tv_series.channel where tv_channel.series_name = "Sky Radio"
select count(*), cartoon.directed_by from cartoon group by cartoon.directed_by
select count(*), cartoon.directed_by from cartoon group by cartoon.directed_by
select cartoon.production_code, cartoon.channel from cartoon order by cartoon.original_air_date desc limit 1
select cartoon.production_code, cartoon.channel from cartoon order by cartoon.original_air_date desc limit 1
select tv_channel.package_option, tv_channel.series_name from tv_channel where tv_channel.hight_definition_tv!= "null"
select tv_channel.package_option, tv_channel.series_name from tv_channel join tv_series on tv_channel.id = tv_series.channel where tv_channel.hight_definition_tv = "Yes"
select tv_channel.country from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.written_by = "Todd Casey"
select tv_channel.country from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.written_by = "Todd Casey"
select tv_channel.country from tv_channel except select tv_channel.country from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.written_by = "Todd Casey"
select tv_channel.country from tv_channel except select tv_channel.country from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.written_by = "Todd Casey"
select tv_channel.series_name, tv_channel.country from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.directed_by = "Ben Jones" intersect select tv_channel.series_name, tv_channel.country from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.directed_by = "Michael Chang"
select tv_channel.series_name, tv_channel.country from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.directed_by = "Ben Jones" intersect select tv_channel.series_name, tv_channel.country from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.directed_by = "Michael Chang"
select tv_channel.pixel_aspect_ratio_par, tv_channel.country from tv_channel where tv_channel.language != "English"
select tv_channel.pixel_aspect_ratio_par, tv_channel.country from tv_channel where tv_channel.language != "English"
select tv_channel.id from tv_channel join country on tv_channel.country = country.country_code group by country.country_code having count(*) > 2
select tv_channel.id from tv_channel group by tv_channel.id having count(*) > 2
select tv_channel.id from tv_channel except select cartoon.channel from cartoon where cartoon.directed_by = "Ben Jones"
select tv_channel.id from tv_channel except select cartoon.channel from cartoon where cartoon.directed_by = "Ben Jones"
select tv_channel.package_option from tv_channel except select tv_channel.package_option from cartoon join tv_channel on cartoon.id = tv_channel.id where cartoon.directed_by = "Ben Jones"
select tv_channel.package_option from tv_channel except select tv_channel.package_option from cartoon join tv_channel on cartoon.id = tv_channel.id where cartoon.directed_by = "Ben Jones"
select count(*) from poker_player
select count(*) from poker_player
select poker_player.earnings from poker_player order by poker_player.earnings desc
select poker_player.earnings from poker_player order by poker_player.earnings desc
select poker_player.final_table_made, poker_player.best_finish from poker_player
select poker_player.final_table_made, poker_player.best_finish from poker_player
select avg(poker_player.earnings) from poker_player
select avg(poker_player.earnings) from poker_player
select poker_player.money_rank from poker_player order by poker_player.earnings desc limit 1
select poker_player.money_rank from poker_player order by poker_player.earnings desc limit 1
select max(poker_player.final_table_made) from poker_player where poker_player.earnings < 200000
select max(poker_player.final_table_made) from poker_player where poker_player.earnings < 200000
select people.name from people join poker_player on people.people_id = poker_player.people_id
select people.name from people join poker_player on people.people_id = poker_player.people_id
select people.name from people join poker_player on people.people_id = poker_player.people_id where poker_player.earnings > 300000
select people.name from people join poker_player on people.people_id = poker_player.people_id where poker_player.earnings > 300000
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.final_table_made asc
select people.name from people join poker_player on people.people_id = poker_player.people_id order by poker_player.final_table_made asc
select people.birth_date from people join poker_player on people.people_id = poker_player.people_id order by poker_player.earnings asc limit 1
select people.birth_date from people join poker_player on people.people_id = poker_player.people_id order by poker_player.earnings asc limit 1
select poker_player.money_rank from people join poker_player on people.people_id = poker_player.people_id order by people.height desc limit 1
select poker_player.money_rank from people join poker_player on people.people_id = poker_player.people_id order by people.height desc limit 1
select avg(poker_player.earnings) from people join poker_player on people.people_id = poker_player.people_id where people.height > 200
select avg(poker_player.earnings) from people join poker_player on people.people_id = poker_player.people_id where people.height > 200
select people.name from people join poker_player on people.people_id = poker_player.people_id order by poker_player.earnings desc
select people.name from people join poker_player on people.people_id = poker_player.people_id order by poker_player.earnings desc
select people.nationality, count(*) from people group by people.nationality
select people.nationality, count(*) from people group by people.nationality
select people.nationality from people group by people.nationality order by count(*) desc limit 1
select people.nationality from people group by people.nationality order by count(*) desc limit 1
select people.nationality from people group by people.nationality having count(*) >= 2
select people.nationality from people group by people.nationality having count(*) >= 2
select people.name, people.birth_date from people order by people.name asc
select people.name, people.birth_date from people order by people.name asc
select people.name from people where people.nationality != "Russia"
select people.name from people where people.nationality != "Russia"
select people.name from people where people.people_id not in (select poker_player.people_id from poker_player)
select people.name from people where people.people_id not in (select poker_player.people_id from poker_player)
select count(distinct people.nationality) from people
select count(distinct people.nationality) from people
select count(*) from area_code_state
select contestants.contestant_number, contestants.contestant_name from contestants order by contestants.contestant_name desc
select votes.vote_id, votes.phone_number, votes.state from votes
select max(area_code_state.area_code), min(area_code_state.area_code) from area_code_state
select max(votes.created) from votes where votes.state = "CA"
select contestants.contestant_name from contestants where contestants.contestant_name != "Jessie Alloway"
select distinct votes.state, votes.created from votes
select contestants.contestant_number, contestants.contestant_name from contestants join votes on contestants.contestant_number = votes.contestant_number group by contestants.contestant_number having count(*) >= 2
select contestants.contestant_number, contestants.contestant_name from votes join contestants on votes.contestant_number = contestants.contestant_number group by contestants.contestant_number order by count(*) asc limit 1
select count(*) from votes where votes.state = "NY" or votes.state = "CA"
select count(*) from contestants where contestants.contestant_number not in (select votes.contestant_number from votes)
select area_code_state.area_code from area_code_state join votes on area_code_state.state = votes.state group by votes.area_code order by count(*) desc limit 1
select votes.created, votes.state, votes.phone_number from votes join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = "Tabatha Gehling"
select votes.area_code from votes join area_code_state on votes.area_code = area_code_state.area_code join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = "Tabatha Gehling" intersect select area_code_state.area_code from votes join area_code_state on votes.area_code = area_code_state.area_code join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = "Kelly Clauss"
select contestants.contestant_name from contestants where contestants.contestant_name like "%Al%"
select country.name from country where country.indepyear > 1950
select country.name from country where country.indepyear > 1950
select count(*) from country where country.governmentform = "Republic"
select count(*) from country where country.governmentform = "Republic"
select sum(country.surfacearea) from country where country.region = "Caribbean"
select sum(country.surfacearea) from country where country.continent = "Carribean"
select country.continent from country where country.name = "Anguilla"
select country.continent from country where country.name = "Anguilla"
select country.region from city join country on city.countrycode = country.code where city.name = "Kabul"
select country.region from city join country on city.countrycode = country.code where city.name = "Kabul"
select countrylanguage.language from countrylanguage join city on countrylanguage.countrycode = city.countrycode where country.name = "Aruba" group by countrylanguage.language order by count(*) desc limit 1
select countrylanguage.language from countrylanguage where country.name = "Aruba"
select country.population, country.lifeexpectancy from country where country.name = "Brazil"
select country.population, country.lifeexpectancy from country where country.name = "Brazil"
select country.region, country.population from country where country.name = "Angola"
select country.region, country.population from country where country.name = "Angola"
select avg(country.lifeexpectancy) from country where country.region = "Central Africa"
select avg(country.lifeexpectancy) from country where country.region = "Central Africa"
select country.name from country where country.continent = "Asia" order by country.lifeexpectancy asc limit 1
select country.name from country where country.continent = "Asia" order by country.lifeexpectancy asc limit 1
select sum(country.population), max(country.gnp) from country where country.continent = "Asia"
select country.gnp, count(*) from country where country.continent = "Asia" order by count(*) desc limit 1
select avg(country.lifeexpectancy) from country where country.continent = "Africa" and country.governmentform = "Republic"
select avg(country.lifeexpectancy) from country where country.continent = "Africa" and country.governmentform = "Republic"
select sum(country.surfacearea) from country where country.continent = "Asia" intersect select country.surfacearea from country where country.continent = "Europe"
select sum(country.surfacearea) from country where country.continent = "Asia" or country.continent = "Europe"
select sum(city.population) from city where city.district = "Gelderland"
select sum(city.population) from city where city.district = "Gelderland"
select avg(country.gnp), sum(country.population) from country where country.governmentform = "US Territory"
select avg(country.gnp), sum(country.population) from country where country.governmentform = "US Territory"
select count(distinct countrylanguage.language) from countrylanguage
select count(distinct countrylanguage.language) from countrylanguage
select count(distinct country.governmentform) from country where country.continent = "Africa"
select count(distinct country.governmentform) from country where country.continent = "Africa"
select count(*) from countrylanguage where country.name = "Aruba"
select count(*) from countrylanguage where country.name = "Aruba"
select count(distinct countrylanguage.isofficial) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = "Afghanistan"
select count(distinct countrylanguage.isofficial) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = "Afghanistan"
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode group by country.name order by count(*) desc limit 1
select country.name, countrylanguage.language from countrylanguage join country on countrylanguage.countrycode = country.code group by countrylanguage.language order by count(*) desc limit 1
select country.continent from country where countrylanguage.language = (select country.language from country group by country.language order by count(*) desc limit 1)
select country.continent from country join countrylanguage on country.code = countrylanguage.countrycode group by country.continent order by count(*) desc limit 1
select count(*) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = "English" intersect select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = "Dutch"
select count(*) from countrylanguage where countrylanguage.language = "English" intersect select count(*) from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = "Dutch"
select country.name from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = "English" intersect select country.name from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = "French"
select country.name from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = "English" intersect select country.name from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = "French"
select country.name from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = "English" intersect select country.name from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = "French"
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = "English" intersect select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = "French"
select count(distinct country.continent) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = "Chinese"
select count(distinct country.continent) from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = "Chinese"
select country.region from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = "English" or countrylanguage.language = "Dutch"
select country.region from country where countrylanguage.language = "Dutch" or countrylanguage.language = "English"
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = "English" or countrylanguage.language = "Dutch"
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = "English" or countrylanguage.language = "Dutch"
select countrylanguage.language from countrylanguage where country.continent = "Asia" group by countrylanguage.language order by count(*) desc limit 1
select countrylanguage.language from countrylanguage where country.continent = "Asia" group by countrylanguage.language order by count(*) desc limit 1
select countrylanguage.language from countrylanguage join country on countrylanguage.countrycode = country.code group by countrylanguage.language having count(*) = 1
select countrylanguage.language from countrylanguage join country on countrylanguage.countrycode = country.code group by countrylanguage.language having count(*) = 1
select city.name from city join countrylanguage on city.id = countrylanguage.countrycode where countrylanguage.language = "English" and city.population = (select max(countrylanguage.population) from countrylanguage where countrylanguage.language = "English")
select city.name from city join countrylanguage on city.id = countrylanguage.countrycode where countrylanguage.language = "English" group by countrylanguage.countrycode order by count(*) desc limit 1
select country.name, country.population, country.lifeexpectancy from country where country.continent = "Asia" and country.surfacearea = (select max(country.surfacearea) from country order by country.surfacearea desc limit 1)
select country.name, country.population, country.lifeexpectancy from country where country.continent = "Asia" order by country.population desc limit 1
select avg(country.lifeexpectancy) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language!= "English" except select avg(country.lifeexpectancy) from country where countrylanguage.language = "Official"
select avg(country.lifeexpectancy) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language!= "English" except select avg(country.lifeexpectancy) from country where countrylanguage.language = "Official"
select sum(country.population) from country join city on country.code = city.id where city.id not in (select countrylanguage.countrycode from countrylanguage where countrylanguage.language = "English")
select count(*) from country where country.code not in (select countrylanguage.countrycode from countrylanguage where countrylanguage.language = "English")
select countrylanguage.isofficial from countrylanguage join country on countrylanguage.countrycode = country.code where country.headofstate = "Beatrix"
select countrylanguage.isofficial from countrylanguage join country on countrylanguage.countrycode = country.code where country.headofstate = "Beatrix"
select count(distinct countrylanguage.isofficial) from countrylanguage join country on countrylanguage.countrycode = country.code where country.indepyear < 1930
select sum(countrylanguage.isofficial) from countrylanguage where country.indepyear < 1930
select country.name from country where country.surfacearea > (select max(country.surfacearea) from country where country.continent = "Europe")
select country.name from country where country.surfacearea > (select max(country.surfacearea) from country where country.continent = "Europe")
select country.name from country where country.population < (select min(country.population) from country where country.continent = "Asia")
select country.name from country where country.population < (select min(country.population) from country where country.continent = "Asia")
select country.name from country where country.population > (select max(country.population) from country where country.continent = "Africa")
select country.name from country where country.population > (select country.population from country where country.continent = "Africa")
select country.code from country where country.name not in (select country.name from country where countrylanguage.language = "English")
select country.countrycode from country where country.name not in (select country.name from country where countrylanguage.language = "English")
select countrylanguage.countrycode from countrylanguage where countrylanguage.language!= "English"
select country.code from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language!= "English"
select country.code from country where country.name not in (select country.name from country where country.governmentform = "Republic")
select country.code from country where country.name not in (select country.name from country where country.governmentform = "Republic")
select city.name from country join countrylanguage on country.code = countrylanguage.countrycode where country.region = "European" and countrylanguage.language != "English"
select city.name from city join countrylanguage on city.id = countrylanguage.countrycode where country.continent = "Europe" except select city.name from city join countrylanguage on city.id = countrylanguage.countrycode where countrylanguage.language = "English"
select distinct city.name from city join country on city.countrycode = country.code join countrylanguage on country.countrycode = countrylanguage.countrycode where country.continent = "Asia" and countrylanguage.language = "Chinese"
select distinct city.name from city join country on city.countrycode = country.code where country.continent = "Asia" and countrylanguage.language = "Chinese"
select country.name, country.indepyear, country.surfacearea from country order by country.population asc limit 1
select country.name, country.indepyear, country.surfacearea from country order by country.population asc limit 1
select country.population, country.name, country.headofstate from country order by country.surfacearea desc limit 1
select country.name, country.population, country.headofstate from country order by country.surfacearea desc limit 1
select country.name, countrylanguage.language, count(*) from country join countrylanguage on country.code = countrylanguage.countrycode group by country.name having count(*) >= 3
select country.name, count(*) from country join countrylanguage on country.code = countrylanguage.countrycode group by country.name having count(*) > 2
select count(*), city.district from city where city.population > (select avg(city.population) from city) group by city.district
select count(*), city.district from city where city.population > (select avg(city.population) from city) group by city.district
select country.governmentform, sum(country.population) from country group by country.governmentform having avg(country.lifeexpectancy) > 72
select sum(country.population), country.governmentform from country group by country.governmentform having avg(country.lifeexpectancy) > 72
select avg(country.lifeexpectancy), sum(country.population), country.continent from country group by country.continent having avg(country.lifeexpectancy) < 72
select country.continent, sum(country.population), avg(country.lifeexpectancy) from country group by country.continent
select country.name, country.surfacearea from country order by country.surfacearea desc limit 5
select country.name, country.surfacearea from country order by country.surfacearea desc limit 5
select country.name from country order by country.population desc limit 3
select country.name from country order by country.population desc limit 3
select country.name from country order by country.population asc limit 3
select country.name from country order by country.population asc limit 3
select count(*) from country where country.continent = "Asia"
select count(*) from country where country.continent = "Asia"
select country.name from country where country.continent = "Europe" and country.population = 80000
select country.name from country where country.continent = "Europe" and country.population = 80000
select sum(country.population), avg(country.surfacearea) from country where country.continent = "North America" and country.surfacearea > 3000
select sum(country.population), avg(country.surfacearea) from country where country.continent = "North America" and country.surfacearea > 3000
select city.name from city where city.population between 160000 and 900000
select city.name from city where city.population between 160000 and 900000
select countrylanguage.language from countrylanguage group by countrylanguage.language order by count(*) desc limit 1
select countrylanguage.language from countrylanguage group by countrylanguage.language order by count(*) desc limit 1
select countrylanguage.language from countrylanguage group by countrylanguage.language order by countrylanguage.percentage desc limit 1
select countrylanguage.countrycode, countrylanguage.language from countrylanguage where countrylanguage.percentage = (select max(countrylanguage.percentage) from countrylanguage group by countrylanguage.language)
select count(*) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = "Spanish" and countrylanguage.percentage = (select max(countrylanguage.percentage) from countrylanguage order by countrylanguage.percentage desc limit 1)
select count(*) from countrylanguage where countrylanguage.language = "Spanish"
select country.code from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = "Spanish" and countrylanguage.percentage = (select max(countrylanguage.percentage) from countrylanguage order by countrylanguage.percentage desc limit 1)
select countrylanguage.countrycode from countrylanguage where countrylanguage.language = "Spanish"
select count(*) from conductor
select count(*) from conductor
select conductor.name from conductor order by conductor.age asc
select conductor.name from conductor order by conductor.age asc
select conductor.name from conductor where conductor.nationality != "USA"
select conductor.name from conductor where conductor.nationality != "USA"
select orchestra.record_company from orchestra order by orchestra.year_of_founded desc
select orchestra.record_company from orchestra order by orchestra.year_of_founded desc
select avg(show.attendance) from show
select avg(show.attendance) from show
select max(performance.share), min(performance.share) from performance where performance.type != "Live final"
select max(performance.share), min(performance.share) from performance where performance.type != "Live final"
select count(distinct conductor.nationality) from conductor
select count(distinct conductor.nationality) from conductor
select conductor.name from conductor order by conductor.year_of_work desc
select conductor.name from conductor order by conductor.year_of_work desc
select conductor.name from conductor order by conductor.year_of_work desc limit 1
select conductor.name from conductor order by conductor.year_of_work desc limit 1
select conductor.name, orchestra.orchestra from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id
select conductor.name, orchestra.orchestra from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id having count(*) > 1
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id having count(*) > 1
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by orchestra.conductor_id order by count(*) desc limit 1
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by orchestra.conductor_id order by count(*) desc limit 1
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id where orchestra.year_of_founded > 2008
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id where orchestra.year_of_founded > 2008
select orchestra.record_company, count(*) from orchestra group by orchestra.record_company
select orchestra.record_company, count(*) from orchestra group by orchestra.record_company
select orchestra.major_record_format from orchestra group by orchestra.major_record_format order by count(*) asc
select orchestra.major_record_format from orchestra group by orchestra.major_record_format order by count(*) asc
select orchestra.record_company from orchestra group by orchestra.record_company order by count(*) desc limit 1
select orchestra.record_company from orchestra group by orchestra.record_company order by count(*) desc limit 1
select orchestra.orchestra from orchestra where orchestra.orchestra_id not in (select performance.orchestra_id from performance)
select orchestra.orchestra from orchestra where orchestra.orchestra_id not in (select performance.orchestra_id from performance)
select orchestra.record_company from orchestra where orchestra.year_of_founded < 2003 intersect select orchestra.record_company from orchestra where orchestra.year_of_founded > 2003
select orchestra.record_company from orchestra where orchestra.year_of_founded < 2003 intersect select orchestra.record_company from orchestra where orchestra.year_of_founded > 2003
select count(*) from orchestra where orchestra.major_record_format = "CD" or orchestra.major_record_format = "DVD"
select count(*) from orchestra where orchestra.major_record_format = "CD" or orchestra.major_record_format = "DVD"
select orchestra.year_of_founded from performance join orchestra on performance.orchestra_id = orchestra.orchestra_id group by performance.orchestra_id having count(*) > 1
select orchestra.year_of_founded from performance join orchestra on performance.orchestra_id = orchestra.orchestra_id group by performance.orchestra_id having count(*) > 1
select count(*) from highschooler
select count(*) from highschooler
select highschooler.name, highschooler.grade from highschooler
select highschooler.name, highschooler.grade from highschooler
select highschooler.grade from highschooler
select highschooler.grade from highschooler
select highschooler.grade from highschooler where highschooler.name = "Kyle"
select highschooler.grade from highschooler where highschooler.name = "Kyle"
select highschooler.name from highschooler where highschooler.grade = 10
select highschooler.name from highschooler where highschooler.grade = 10
select highschooler.id from highschooler where highschooler.name = "Kyle"
select highschooler.id from highschooler where highschooler.name = "Kyle"
select count(*) from highschooler where highschooler.grade = 9 or highschooler.grade = 10
select count(*) from highschooler where highschooler.grade = 9 or highschooler.grade = 10
select highschooler.grade, count(*) from highschooler group by highschooler.grade
select highschooler.grade, count(*) from highschooler group by highschooler.grade
select highschooler.grade from highschooler group by highschooler.grade order by count(*) desc limit 1
select highschooler.grade from highschooler group by highschooler.grade order by count(*) desc limit 1
select highschooler.grade from highschooler group by highschooler.grade having count(*) >= 4
select highschooler.grade from highschooler group by highschooler.grade having count(*) >= 4
select friend.student_id, count(*) from friend group by friend.student_id
select count(*), friend.student_id from friend group by friend.student_id
select highschooler.name, count(*) from highschooler join friend on highschooler.id = friend.student_id group by friend.student_id
select highschooler.name, count(*) from highschooler join friend on highschooler.id = friend.student_id group by friend.student_id
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by friend.student_id order by count(*) desc limit 1
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by friend.student_id order by count(*) desc limit 1
select highschooler.name from friend join highschooler on friend.student_id = highschooler.id group by friend.student_id having count(*) >= 3
select highschooler.name from friend join highschooler on friend.student_id = highschooler.id group by friend.student_id having count(*) >= 3
select highschooler.name from highschooler join friend on highschooler.id = friend.friend_id where highschooler.name = "Kyle"
select distinct friend.name from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = "Kyle"
select count(*) from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = "Kyle"
select count(distinct highschooler.id) from highschooler join friend on highschooler.id = friend.friend_id where highschooler.name = "Kyle"
select highschooler.id from highschooler except select friend.student_id from friend
select highschooler.id from highschooler except select friend.student_id from friend
select highschooler.name from highschooler where highschooler.id not in (select friend.student_id from friend)
select highschooler.name from highschooler where highschooler.id not in (select friend.student_id from friend)
select highschooler.id from highschooler join friend on highschooler.id = friend.friend_id intersect select likes.liked_id from likes join friend on highschooler.id = friend.friend_id
select friend.student_id from friend join likes on friend.student_id = likes.liked_id intersect select likes.student_id from likes
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id intersect select likes.student_id from likes
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id intersect select highschooler.name from highschooler join likes on highschooler.id = likes.student_id
select likes.student_id, count(*) from likes group by likes.student_id
select likes.student_id, count(*) from likes group by likes.student_id
select highschooler.name, count(*) from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id
select highschooler.name, count(*) from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id order by count(*) desc limit 1
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id order by count(*) desc limit 1
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id having count(*) >= 2
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id having count(*) >= 2
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id where highschooler.grade > 5 group by friend.student_id having count(*) >= 2
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id where highschooler.grade > 5 group by friend.student_id having count(*) >= 2
select count(*) from likes join highschooler on likes.student_id = highschooler.id where highschooler.name = "Kyle"
select count(*) from highschooler join likes on highschooler.id = likes.student_id where highschooler.name = "Kyle"
select avg(highschooler.grade), friend.student_id from friend join highschooler on friend.student_id = highschooler.id
select avg(highschooler.grade) from highschooler join friend on highschooler.id = friend.student_id
select min(highschooler.grade) from highschooler where highschooler.id not in (select friend.student_id from friend)
select min(highschooler.grade) from highschooler where highschooler.id not in (select friend.student_id from friend)
select owners.state from owners intersect select professionals.state from professionals
select owners.state from owners intersect select professionals.state from professionals
select avg(dogs.age) from dogs where dogs.dog_id in (select treatments.dog_id from treatments)
select avg(dogs.age) from dogs where dogs.dog_id in (select treatments.dog_id from treatments)
select professionals.first_name, professionals.last_name, professionals.cell_number from professionals where professionals.state = "Indiana" group by professionals.first_name, professionals.last_name, professionals.cell_number having count(*) > 2
select professionals.professional_id, professionals.last_name, professionals.cell_number from professionals where professionals.state = "Indiana" union select treatments.professional_id, professionals.last_name, professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count(*) > 2
select dogs.name from dogs where dogs.owner_id not in (select owners.owner_id from owners join treatments on owners.owner_id = treatments.owner_id where treatments.cost_of_treatment > 1000)
select dogs.name from dogs join owners on dogs.owner_id = owners.owner_id where owners.owner_id not in (select dogs.owner_id from dogs join treatments on dogs.dog_id = treatments.dog_id group by dogs.owner_id having sum(treatments.cost_of_treatment) > 1000)
select distinct professionals.first_name from professionals join owners on professionals.professional_id = owners.professional_id where owners.owner_id not in (select dogs.owner_id from dogs)
select distinct professionals.first_name from professionals join owners on professionals.professional_id = owners.professional_id where owners.owner_id not in (select dogs.owner_id from dogs)
select professionals.professional_id, professionals.role_code, professionals.email_address from professionals except select professionals.professional_id, professionals.role_code, professionals.email_address from professionals join treatments on professionals.professional_id = treatments.professional_id
select professionals.professional_id, professionals.role_code, professionals.email_address from professionals except select professionals.professional_id, professionals.role_code, professionals.email_address from professionals join treatments on professionals.professional_id = treatments.professional_id
select owners.owner_id, owners.first_name, owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count(*) desc limit 1
select owners.owner_id, owners.first_name, owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count(*) desc limit 1
select professionals.professional_id, professionals.role_code, professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id group by professionals.professional_id having count(*) >= 2
select professionals.professional_id, professionals.role_code, professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id group by professionals.professional_id having count(*) >= 2
select breeds.breed_name from dogs join breeds on dogs.breed_code = breeds.breed_code group by breeds.breed_code order by count(*) desc limit 1
select breeds.breed_name from dogs join breeds on dogs.breed_code = breeds.breed_code group by breeds.breed_name order by count(*) desc limit 1
select owners.owner_id, owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id join treatments on dogs.dog_id = treatments.dog_id group by owners.owner_id order by count(*) desc limit 1
select owners.owner_id, owners.last_name from owners join treatments on owners.owner_id = treatments.owner_id group by owners.owner_id order by count(*) desc limit 1
select treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code group by treatments.treatment_type_code order by sum(treatments.cost_of_treatment) asc limit 1
select treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code group by treatments.treatment_type_code order by sum(treatments.cost_of_treatment) asc limit 1
select dogs.owner_id, owners.zip_code from dogs join owners on dogs.owner_id = owners.owner_id group by dogs.owner_id order by sum(charges.charge_amount) desc limit 1
select owners.owner_id, owners.zip_code from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by sum(charges.charge_amount) desc limit 1
select professionals.professional_id, professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id group by professionals.professional_id having count(*) >= 2
select professionals.professional_id, professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id group by professionals.professional_id having count(*) >= 2
select professionals.first_name, professionals.last_name from professionals join treatments on professionals.professional_id = treatments.professional_id where treatments.cost_of_treatment < (select avg(treatments.cost_of_treatment) from treatments)
select professionals.first_name, professionals.last_name from professionals join treatments on professionals.professional_id = treatments.professional_id where professionals.cost_of_treatment < (select avg(treatments.cost_of_treatment) from treatments)
select treatments.date_of_treatment, professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id
select treatments.date_of_treatment, professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id
select treatments.cost_of_treatment, treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select treatments.cost_of_treatment, treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select owners.first_name, owners.last_name, sizes.size_code from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id
select owners.first_name, owners.last_name, dogs.size_code from owners join dogs on owners.owner_id = dogs.owner_id
select owners.first_name, dogs.name from owners join dogs on owners.owner_id = dogs.owner_id
select owners.first_name, dogs.name from owners join dogs on owners.owner_id = dogs.owner_id
select dogs.name, dogs.date_of_treatment from dogs join treatments on dogs.dog_id = treatments.dog_id join breeds on breeds.breed_code = dogs.breed_code
select dogs.name, treatments.date_of_treatment from dogs join breeds on dogs.breeds_code = breeds.breed_code
select owners.first_name, dogs.name from owners join dogs on owners.owner_id = dogs.owner_id where owners.state = "Virginia"
select owners.first_name, dogs.name from owners join dogs on owners.owner_id = dogs.owner_id where owners.state = "Virginia"
select dogs.date_arrived, dogs.date_departed from dogs join treatments on dogs.dog_id = treatments.dog_id
select dogs.date_arrived, dogs.date_departed from dogs join treatments on dogs.dog_id = treatments.dog_id
select owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id order by dogs.age desc limit 1
select owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id order by dogs.age asc limit 1
select professionals.email_address from professionals where professionals.state = "Hawaii" or professionals.state = "Wisconsin"
select professionals.email_address from professionals where professionals.state = "Hawaii" or professionals.state = "Wisconsin"
select dogs.date_arrived, dogs.date_departed from dogs
select dogs.date_arrived, dogs.date_departed from dogs
select count(distinct treatments.dog_id) from treatments
select count(distinct treatments.dog_id) from treatments
select count(distinct treatments.professional_id) from treatments
select count(distinct treatments.professional_id) from treatments
select professionals.role_code, professionals.city, professionals.street, professionals.state from professionals where professionals.city like "%West%"
select professionals.role_code, professionals.street, professionals.city, professionals.state from professionals where professionals.city like "%West%"
select owners.first_name, owners.last_name, owners.email_address from owners where owners.state like "%North%"
select owners.first_name, owners.last_name, owners.email_address from owners where owners.state like "%North%"
select count(*) from dogs where dogs.age < (select avg(dogs.age) from dogs)
select count(*) from dogs where dogs.age < (select avg(dogs.age) from dogs)
select treatments.cost_of_treatment from treatments order by treatments.cost_of_treatment desc limit 1
select treatments.cost_of_treatment from treatments order by treatments.date_of_treatment desc limit 1
select count(*) from dogs where dogs.dog_id not in (select treatments.dog_id from treatments)
select count(*) from dogs where dogs.dog_id not in (select treatments.dog_id from treatments)
select count(*) from owners where owners.owner_id not in (select dogs.owner_id from dogs)
select count(*) from owners where owners.owner_id not in (select dogs.owner_id from dogs)
select count(*) from professionals where professionals.professional_id not in (select treatments.professional_id from treatments)
select count(*) from professionals where professionals.professional_id not in (select treatments.professional_id from treatments)
select dogs.name, dogs.age, dogs.weight from dogs where dogs.abandoned_yn = "1"
select dogs.name, dogs.age, dogs.weight from dogs where dogs.abandoned_yn = 1
select avg(dogs.age) from dogs
select avg(dogs.age) from dogs
select dogs.age from dogs order by dogs.date_arrived desc limit 1
select dogs.age from dogs order by dogs.date_arrived desc limit 1
select charges.charge_type, sum(charges.charge_amount) from charges group by charges.charge_type
select charges.charge_type, charges.charge_amount from charges
select max(charges.charge_amount), charges.charge_type from charges order by charges.charge_type desc limit 1
select max(charges.charge_amount) from charges order by charges.charge_type desc limit 1
select professionals.email_address, professionals.cell_number, professionals.home_phone from professionals
select professionals.email_address, professionals.cell_number, professionals.home_phone from professionals
select treatment_types.treatment_type_code, treatment_types.size_type_description from treatment_types
select distinct dogs.breed_code, dogs.size_code from dogs
select professionals.first_name, treatment_types.treatment_type_description from professionals join treatments on professionals.professional_id = treatments.professional_id join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select professionals.first_name, treatment_types.treatment_type_description from professionals join treatments on professionals.professional_id = treatments.professional_id join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select count(*) from singer
select count(*) from singer
select singer.name from singer order by singer.net_worth_millions asc
select singer.name from singer order by singer.net_worth_millions asc
select singer.birth_year, singer.citizenship from singer
select singer.birth_year, singer.citizenship from singer
select singer.name from singer where singer.citizenship != "France"
select singer.name from singer where singer.citizenship!= "French"
select singer.name from singer where singer.birth_year = 1948 or singer.birth_year = 1949
select singer.name from singer where singer.birth_year = 1948 or singer.birth_year = 1949
select singer.name from singer order by singer.net_worth_millions desc limit 1
select singer.name from singer order by singer.net_worth_millions desc limit 1
select singer.citizenship, count(*) from singer group by singer.citizenship
select singer.citizenship, count(*) from singer group by singer.citizenship
select singer.citizenship from singer group by singer.citizenship order by count(*) desc limit 1
select singer.citizenship from singer group by singer.citizenship order by count(*) desc limit 1
select singer.citizenship, max(singer.net_worth_millions) from singer group by singer.citizenship
select max(singer.net_worth_millions), singer.citizenship from singer group by singer.citizenship
select song.title, singer.name from singer join song on singer.singer_id = song.singer_id
select song.title, singer.name from song join singer on song.singer_id = singer.singer_id
select distinct singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000
select distinct singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000
select singer.name from singer join song on singer.singer_id = song.singer_id group by song.singer_id having count(*) > 1
select singer.name from singer join song on singer.singer_id = song.singer_id group by song.singer_id having count(*) > 1
select singer.name, sum(song.sales) from singer join song on singer.singer_id = song.singer_id group by singer.name
select sum(song.sales), singer.name from singer join song on singer.singer_id = song.singer_id group by singer.name
select singer.name from singer where singer.singer_id not in (select song.singer_id from song)
select singer.name from singer where singer.singer_id not in (select song.singer_id from song)
select singer.citizenship from singer where singer.birth_year < 1945 intersect select singer.citizenship from singer where singer.birth_year > 1955
select singer.citizenship from singer where singer.birth_year < 1945 intersect select singer.citizenship from singer where singer.birth_year > 1955
select count(*) from other_available_features
select ref_feature_types.feature_type_name from other_available_features join ref_feature_types on other_available_features.feature_type_code = ref_feature_types.feature_type_code where other_available_features.feature_name = "AirCon"
select ref_property_types.property_type_description, properties.property_type_code from properties join ref_property_types on properties.property_type_code = ref_property_types.property_type_code group by properties.property_type_code
select properties.property_name from properties where properties.property_type_code = "House" or properties.room_count > 1
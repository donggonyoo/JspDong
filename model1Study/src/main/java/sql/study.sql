create table member(
	id varchar(20) primary key,
	pass varchar(20),
	name varchar(20),
	gender int(1),
	tel varchar(15),
	email varchar(50),
	picture varchar(200)
);


select * from member;
desc member;

select * from member where id="gg2";


/*---------------------book table-----------------*/
create table book(
 writer varchar(100) primary key,
 title varchar(100),
 content varchar(300)
);

select * from book;

create table adder(
fruits varchar(30),
num int(5)
);

select * from adder;
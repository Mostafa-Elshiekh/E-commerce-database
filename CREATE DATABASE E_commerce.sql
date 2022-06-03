CREATE DATABASE E_commerce;

--user table
create table User_
(
user_id       int        not null,
user_name     char(20)   not null,
user_mobile   int        not null,
user_email    char(44)   not null,
user_address  char(20)   not null,
user_pass     char(20)   not null,
primary key(user_id)
);

insert into User_
values (1,'Mostafa',01289188678,'mostafamahmoud12349@gmail.com','mostafa123','tanta');
insert into User_
values (2,'Ahmaed',01210957522,'ahmaedmahmoud12@gmail.com','ahmaed123','tanta');

select *from User_;



--Roles table
create table Roles_
(
role_id                 int        not null,
role_name               char(20)   not null,
role_desc               char(20)    not null,
fk_Roles_user           int        not null,
primary key (role_id),
constraint fk_Roles foreign key(fk_Roles_user) references User_(user_id)
);

insert into Roles_
values (200,'used','shopping',1);
insert into Roles_
values (201,'manger','edit or Inquires',2);

select *from Roles_
select *from User_, Roles_
where fk_Roles_user=1 and user_id=1;

select *from User_, Roles_
where fk_Roles_user=2 and user_id=2;



drop table Permission_
--Permission table
create table Permission_
(
per_id                    int      not null,
Permission_name           char(20) not null,
fk_Permission_role        int  not null,
primary key(per_id),
constraint fk_Permission foreign key(fk_Permission_role) references Roles_(role_id)
);

insert into Permission_ 
values (30,'Request a product',200);
insert into Permission_ 
values (36,'Add Products',201);

select *from Permission_

select *from User_,Roles_,Permission_
where fk_Roles_user=user_id and role_id=fk_Permission_role;

select *from User_, Roles_,Permission_
where fk_Roles_user=1 and role_id=200 and fk_Permission_role=2;



--Payment table
create table Payment_
(
pay_id           int           not null,
pay_time         datetime     not null,
pay_amount          int           not null,
pay_type         char(20)      not null,
pay_status		BIT			not null,
primary key(pay_id),
fk_Payment_User  int           not null,
constraint fk_Payment foreign key(fk_Payment_User) references User_(user_id)
);

insert into Payment_
values(600,'2020-2-21 10:00 AM', 50, 'visa', 1, 1)

select * from Payment_


--delivery table
create table delivery
(
del_id			     int        not null,
del_address			 char(50)	not null,
del_company	         char(50)   not null,
del_date             Date       not null,
del_status			 BIT		not null,
fk_delivery_User     int        not null,    
fk_delivery_Pay		 int        not null,    
constraint fk_shipping foreign key(fk_delivery_User) references User_(user_id),
constraint fk_del_pay foreign key(fk_delivery_Pay) references Payment_(pay_id)
);


insert into delivery 
	values	(403,'homos st.','aramex','1-2-2021',0, 2, 603);
values (400,'elnadi st.','aramex','1-1-2021',0, 1, 600),

select *from delivery
select *from User_,Roles_,Permission_,delivery , Payment_
where user_id = fk_Roles_user and role_id = fk_Permission_role and user_id =fk_delivery_User and pay_id = fk_delivery_Pay



--order table
create table order_
(
ord_id          int       not null,
ord_date		date		not null,
ord_desc        char(50)     not null,
fk_order_payment int      not null,
constraint fk_oder foreign key(fk_order_payment) references Payment_(pay_id)
);

insert into order_
values(700,'3-2-2021','cat, medal, coffee', 600);




--Product table
create table Product_
(
pro_id          int        not null,
pro_name        char(20)   not null,
pro_desc        char(20)   not null,
pro_category    char(20)   not null,
fk_Product_User int        not null,
constraint fk_Product foreign key(fk_Product_User) references User_(user_id)
);
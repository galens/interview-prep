#How would you design a relational database schema for  apartment management 
# (IE tenants, apartments, apartment problems, maintenance people, maintenance tickets)?

create table person (
	person_id 	int not null auto_increment,
	first_name	varchar(50) not null,
	last_name	varchar(50) not null,
	telephone	varchar(20) not null,
	primary key (person_id)
);

create table tenants (
	tenant_id	int not null auto_increment,
	person_id	int not null,
	apartment_id	int not null,
	apt_num	varchar(10) not null,
	move_in_date	date not null,
	foreign key (person_id) references person (person_id),
	foreign key (apartment_id) references apartment (apartment_id),
	primary key (tenant_id)
);

create table apartments (
	apartment_id	int not null auto_increment,
	address	varchar(50) not null,
	city		varchar(50) not null,
	state		varchar(50) not null,
	zipcode	varchar(50) not null,
	primary key (apartment_id)
);

create table managers (
	manager_id	int not null auto_increment,
	person_id	int not null,
	foreign key (person_id) references person (person_id),
	primary key (manager_id)
);

create table managed_tenants (
	managed_id	int not null auto_increment,
	manager_id	int not null,
	tenant_id	int not null,
	foreign key (tenant_id) references tenants (tenant_id),
	foreign key (manager_id) references managers (manager_id),
	primary key (managed_id)
);

create table managed_apartments (
	managed_id	int not null auto_increment,
	manager_id	int not null,
	apartment_id	int not null,
	foreign key (apartment_id) references apartments (apartment_id),
	foreign key (manager_id) references managers (manager_id),
	primary key (managed_id)
);

create table issues (
	issue_id	int not null auto_increment,
	tenant_id	int not null,
	apartment_id	int not null,
	issue_body	text,
	status		varchart(20),
	foreign key (apartment_id) references apartments (apartment_id),
	foreign key (tenant_id) references tenants (tenant_id),
	primary key (issue_id)
);

create table maintenance_workers (
	maintain_id	int not null auto_increment,
	person_id	int not null,
	business_name	varchar(50) not null,
	business_phone	varchar(20) not null,
	foreign key (person_id) references person (person_id),
	primary key (maintain_id)
);

create table maintenance_tickets (
	assign_id	int not null auto_increment,
	worker_id	int not null,
	issue_id	int not null,
	notes		text,
	foreign key (issue_id) references issues (issue_id),
	foreign key (worker_id) references maintenance_workers (maintain_id),
	primary key (assign_id)
);

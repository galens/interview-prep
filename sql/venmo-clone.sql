create table users (
	user_id	int not null auto_increment,
	password_hash varchar(50) not null,
	permissions	int(10) not null,
	account_id int not null,
	primary key (user_id)
);

create table account (
	account_id	int not null auto_increment,
	bank_account_num	int(20) not null,
	bank_routing_num	int(20) not null,
	current_balance	decimal(15,2) not null,
	primary key (account_id)
);

create table transfer_logs (
	transfer_id	int not null auto_increment,
	transfer_source	varchar(50) not null,
	transfer_destination	varchar(50) not null,
	description		text not null,
	status			varchar(20) not null,
	user_id		int not null,
	primary key (transfer_id)
);

create table api_info (
	api_id		int not null auto_increment,
	token		varchar(50) not null,
	created_date	date not null,
	expiry_date	date not null,
	user_id	int not null,
	primary key (api_id)
);

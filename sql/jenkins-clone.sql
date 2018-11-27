create table users (
	user_id	int not null auto_increment,
	password_hash varchar(50) not null,
	permissions	int(10) not null,
	primary key (user_id)
);

create table build_settings (
	build_settings_id	 int not null auto_increment,
	build_timeout		 int not null default 60,
	discard_old_builds	 int(2) not null default 0,
	primary key (build_settings_id)
);

create table build_triggers (
	build_triggers_id	int not null auto_increment,
	trigger_remotely	int(2),
	poll			int(2),
	poll_schedule		varchar(50),
	primary key (build_triggers_id)
);

create table item (
	item_id			int not null auto_increment,
	item_name		varchar(100) not null, #pipeline, freestyle, external job
	display_name		varchar(100) null,
	description		text null,
	item_type		varchar(100) not null,
	branch_source	varchar(50) null, #array of branch_source id's
	build_settings_id	int null,
	build_triggers_id	int null,
	jenkins_file		varchar(100) not null,
	primary key (item_id)
);

create table branch_source (
	source_id		int not null auto_increment,
	source_type		varchar(50) not null,
	source_path		varchar(100) not null,
	primary key (source_id)
);

create table api_info (
	api_id		int not null auto_increment,
	token		varchar(50) not null,
	created_date	date not null,
	expiry_date	date not null,
	user_id	int not null,
	primary key (api_id)
);

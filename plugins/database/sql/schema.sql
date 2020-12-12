CREATE TABLE guilds (
    guild_id 
    /* For api */
    guild_roles INT(15) NOT NULL DEFAULT 0,
    guild_channels INT(15) NOT NULL DEFAULT 0,
    guild_name VARCHAR(20) NOT NULL DEFAULT 0,
    PRIMARY KEY int (guild_id)
)

CREATE TABLE guild_settings (
    /* Default muted role is generated everytime the bot joins the guild although this can be updated*/
    guild_id INT(20) NOT NULL DEFAULT 0,
    muted_role INT(20) DEFAULT 'Muted',
    guild_prefix VARCHAR(15) DEFAULT 'u!',
    /* These are different types of logging you can have moderation logs e.g: a ban log or just action logs..*/
    logging_moderation BIGINT DEFAULT NULL,
    logging_action BIGINT DEFAULT NULL,
    /* You can toggle join logs but action logs already toggles it on but if you want less logs you can toggle logging_leave or logging_join.*/
    logging_join BIGINT DEFAULT NULL,
    logging_leave BIGINT DEFAULT NULL,
    logging_leave BIGINT DEFAULT NULL,
    PRIMARY KEY (muted_role, guild_prefix, logging_moderation, logging_action, logging_leave, logging_join, logging_leave),
    guild_id int FOREIGN KEY REFERENCES guilds(guild_id)

);  

CREATE TABLE warns (
    user_id int FOREIGN KEY REFERENCES users(user_id),
    user_warns int FOREIGN KEY REFERENCES users(user_warns)
);

CREATE TABLE users (
    user_id INT(20) NOT NULL DEFAULT 0,
    user_warns BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id, user_warns)

);
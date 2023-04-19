ALTER TABLE `client_scope`.`chat_room_users`
    ADD COLUMN `last_chat_message_id` INT (11) DEFAULT 0 NULL AFTER `is_owner`,
  ADD COLUMN `last_message_timestamp` DATETIME NULL AFTER `last_chat_message_id`,
  ADD COLUMN `unread_message_counts` INT (11) DEFAULT 0 NULL AFTER `last_message_timestamp`,
  ADD COLUMN `is_anonymous` TINYINT (2) DEFAULT 0 NULL AFTER `unread_message_counts`,
  CHANGE `creted_at` `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP() NOT NULL



ALTER TABLE `client_scope`.`chat_rooms`
DROP COLUMN `last_chat_message_id`,
  DROP COLUMN `last_message_timestamp`,
  ADD COLUMN `is_anonymous` TINYINT (2) DEFAULT 0 NULL AFTER `member_limit`;


ALTER TABLE `client_scope`.`chat_message_status`
    ADD COLUMN `chat_room_id` INT (11) DEFAULT 0 NULL AFTER `user_id`;



ALTER TABLE `client_scope`.`chat_message_delete`
    ADD COLUMN `chat_room_id` INT (11) DEFAULT 0 NULL AFTER `user_id`;


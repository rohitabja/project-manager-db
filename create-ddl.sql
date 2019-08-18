CREATE DATABASE `taskmgr` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE TABLE `parent_task` (
  `id_parent_task` int(11) NOT NULL AUTO_INCREMENT,
  `nm_parent_task` varchar(45) NOT NULL,
  PRIMARY KEY (`id_parent_task`),
  UNIQUE KEY `id_parent_task_UNIQUE` (`id_parent_task`),
  UNIQUE KEY `nm_parent_task_UNIQUE` (`nm_parent_task`)
);

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nm_first` varchar(45) NOT NULL,
  `nm_last` varchar(45) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `deleted` char(1) NOT NULL,
  `dt_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  UNIQUE KEY `id_employee_UNIQUE` (`id_employee`)
);

CREATE TABLE `project` (
  `id_project` int(11) NOT NULL AUTO_INCREMENT,
  `nm_project` varchar(45) NOT NULL,
  `dt_start` date DEFAULT NULL,
  `dt_end` date DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `dt_updated` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_project`),
  UNIQUE KEY `id_project_UNIQUE` (`id_project`),
  KEY `id_user_idx` (`id_user`),
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `task` (
  `id_task` int(11) NOT NULL AUTO_INCREMENT,
  `nm_task` varchar(45) NOT NULL,
  `id_parent_task` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `dt_start` date DEFAULT NULL,
  `dt_end` date DEFAULT NULL,
  `is_completed` char(1) DEFAULT NULL,
  `dt_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_project` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_task`),
  UNIQUE KEY `task_id_UNIQUE` (`id_task`),
  UNIQUE KEY `nm_task_UNIQUE` (`nm_task`),
  KEY `id_project_idx` (`id_project`),
  KEY `id_user_idx` (`id_user`),
  KEY `id_parent_task_idx` (`id_parent_task`),
  CONSTRAINT `id_parent_task` FOREIGN KEY (`id_parent_task`) REFERENCES `parent_task` (`id_parent_task`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `credentials` (
  `domain` varchar(96) DEFAULT NULL,
  `jid` varchar(127) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `failure_reason` varchar(127) DEFAULT NULL,
  `failures` int(11) DEFAULT NULL,
  PRIMARY KEY (`jid`),
  UNIQUE KEY `domain` (`domain`),
  KEY `credentials_index` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `current_tests` (
  `domain` varchar(96) DEFAULT NULL,
  `test` varchar(96) DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  UNIQUE KEY `unique_domain_test` (`domain`,`test`),
  KEY `current_results_index` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `periodic_test_iterations` (
  `iteration_number` int(11) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`iteration_number`),
  KEY `periodic_iterations_index` (`iteration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `periodic_tests` (
  `domain` varchar(96) DEFAULT NULL,
  `test` varchar(96) DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  `iteration_number` int(11) DEFAULT NULL,
  UNIQUE KEY `domain` (`domain`,`test`,`iteration_number`),
  KEY `periodic_results_index` (`iteration_number`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `servers` (
  `domain` varchar(96) DEFAULT NULL,
  `listed` tinyint(1) DEFAULT NULL,
  `software_name` varchar(96) DEFAULT NULL,
  `software_version` varchar(96) DEFAULT NULL,
  KEY `servers_index` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `subscribers` (
  `domain` varchar(96) DEFAULT NULL,
  `unsubscribeCode` varchar(127) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `test` (
  `id` int(11) DEFAULT NULL,
  `unpublished` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

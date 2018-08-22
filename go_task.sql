-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2018-08-22 15:37:50
-- 服务器版本： 5.6.38
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `go_task`
--

-- --------------------------------------------------------

--
-- 表的结构 `default`
--

CREATE TABLE `default` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0正常 -1禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `default`
--

INSERT INTO `default` (`id`, `user_name`, `email`, `password`, `salt`, `last_login`, `last_ip`, `status`) VALUES
(1, 'admin', 'admin@example.com', '7fef6171469e80d32c0559f88b377245', '', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `pp_task`
--

CREATE TABLE `pp_task` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分组ID',
  `server_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '服务器id',
  `task_name` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '任务描述',
  `cron_spec` varchar(100) NOT NULL DEFAULT '' COMMENT '时间表达式',
  `concurrent` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否只允许一个实例',
  `command` text NOT NULL COMMENT '命令详情',
  `timeout` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '超时设置 s',
  `execute_times` int(11) NOT NULL DEFAULT '0' COMMENT '累计执行次数',
  `prev_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上次执行时间',
  `is_notify` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0-不通知，1-通知',
  `notify_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0-邮件通知，1-信息通知，',
  `notify_user_ids` varchar(200) NOT NULL DEFAULT '0' COMMENT '通知用户ID字符串，1,2,3',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '-1删除，0停用 1启用 2审核中,3不通过',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后一次编辑时间',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后一次编辑者ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pp_task`
--

INSERT INTO `pp_task` (`id`, `group_id`, `server_id`, `task_name`, `description`, `cron_spec`, `concurrent`, `command`, `timeout`, `execute_times`, `prev_time`, `is_notify`, `notify_type`, `notify_user_ids`, `status`, `create_time`, `create_id`, `update_time`, `update_id`) VALUES
(1, 4, 0, '打印网络信息', 'ifconfig', '*/5 * * * *', 0, 'ifconfig', 10, 7, 1534923050, 0, 0, '', 0, 1534923001, 1, 1534923001, 0);

-- --------------------------------------------------------

--
-- 表的结构 `pp_task_ban`
--

CREATE TABLE `pp_task_ban` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(64) NOT NULL DEFAULT '0' COMMENT '命令',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0-正常，1-删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限和角色关系表';

--
-- 转存表中的数据 `pp_task_ban`
--

INSERT INTO `pp_task_ban` (`id`, `code`, `create_time`, `update_time`, `status`) VALUES
(1, 'rm -rf', 1528639322, 1528639692, 0),
(2, 'dd if=/dev/random of=/dev/sda', 1528639322, 1528639588, 0),
(3, 'mkfs.ext3 /dev/sda', 1528639445, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `pp_task_group`
--

CREATE TABLE `pp_task_group` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '组名',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `create_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改者Id',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态：1-正常，0-删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pp_task_group`
--

INSERT INTO `pp_task_group` (`id`, `group_name`, `description`, `create_id`, `create_time`, `update_id`, `update_time`, `status`) VALUES
(1, '任务分组甲', '任务分组甲', 1, 1531643000, 1, 1534921367, 0),
(2, '任务分组乙', '任务分组乙', 1, 1531643030, 1, 1534921374, 0),
(3, '任务分组丙', '任务分组丙', 1, 1531643070, 1, 1534921370, 0),
(4, '测试分组', '', 1, 1534921384, 1, 1534921384, 1);

-- --------------------------------------------------------

--
-- 表的结构 `pp_task_log`
--

CREATE TABLE `pp_task_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `task_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '任务ID',
  `output` mediumtext NOT NULL COMMENT '任务输出',
  `error` text NOT NULL COMMENT '错误信息',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `process_time` int(11) NOT NULL DEFAULT '0' COMMENT '消耗时间/毫秒',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pp_task_log`
--

INSERT INTO `pp_task_log` (`id`, `task_id`, `output`, `error`, `status`, `process_time`, `create_time`) VALUES
(1, 1, 'lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384\n	options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>\n	inet 127.0.0.1 netmask 0xff000000 \n	inet6 ::1 prefixlen 128 \n	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 \n	nd6 options=201<PERFORMNUD,DAD>\ngif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280\nstf0: flags=0<> mtu 1280\nXHC20: flags=0<> mtu 0\nen0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	ether 4c:32:75:8b:cb:35 \n	inet6 fe80::d9:73f3:6762:e80a%en0 prefixlen 64 secured scopeid 0x5 \n	inet 172.30.16.62 netmask 0xffffff00 broadcast 172.30.16.255\n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\np2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304\n	ether 0e:32:75:8b:cb:35 \n	media: autoselect\n	status: inactive\nawdl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1484\n	ether 0e:11:63:b6:93:a4 \n	inet6 fe80::c11:63ff:feb6:93a4%awdl0 prefixlen 64 scopeid 0x7 \n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\nen1: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	media: autoselect <full-duplex>\n	status: inactive\nen2: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d1 \n	media: autoselect <full-duplex>\n	status: inactive\nbridge0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	options=63<RXCSUM,TXCSUM,TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	Configuration:\n		id 0:0:0:0:0:0 priority 0 hellotime 0 fwddelay 0\n		maxage 0 holdcnt 0 proto stp maxaddr 100 timeout 1200\n		root id 0:0:0:0:0:0 priority 0 ifcost 0 port 0\n		ipfilter disabled flags 0x2\n	member: en1 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 8 priority 0 path cost 0\n	member: en2 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 9 priority 0 path cost 0\n	nd6 options=201<PERFORMNUD,DAD>\n	media: <unknown type>\n	status: inactive\nutun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000\n	inet6 fe80::d0c4:a697:d252:67df%utun0 prefixlen 64 scopeid 0xb \n	nd6 options=201<PERFORMNUD,DAD>\nutun1: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::5177:a768:4d4d:c4fa%utun1 prefixlen 64 scopeid 0xc \n	nd6 options=201<PERFORMNUD,DAD>\nutun2: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::e1b5:3dd8:2699:2482%utun2 prefixlen 64 scopeid 0xd \n	nd6 options=201<PERFORMNUD,DAD>\nen4: flags=8822<BROADCAST,SMART,SIMPLEX,MULTICAST> mtu 1500\n	ether 9e:e3:3f:8a:6a:94 \n	media: autoselect <full-duplex>\n	status: inactive\n', '', 0, 15, 1534923006),
(2, 1, 'lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384\n	options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>\n	inet 127.0.0.1 netmask 0xff000000 \n	inet6 ::1 prefixlen 128 \n	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 \n	nd6 options=201<PERFORMNUD,DAD>\ngif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280\nstf0: flags=0<> mtu 1280\nXHC20: flags=0<> mtu 0\nen0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	ether 4c:32:75:8b:cb:35 \n	inet6 fe80::d9:73f3:6762:e80a%en0 prefixlen 64 secured scopeid 0x5 \n	inet 172.30.16.62 netmask 0xffffff00 broadcast 172.30.16.255\n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\np2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304\n	ether 0e:32:75:8b:cb:35 \n	media: autoselect\n	status: inactive\nawdl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1484\n	ether 0e:11:63:b6:93:a4 \n	inet6 fe80::c11:63ff:feb6:93a4%awdl0 prefixlen 64 scopeid 0x7 \n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\nen1: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	media: autoselect <full-duplex>\n	status: inactive\nen2: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d1 \n	media: autoselect <full-duplex>\n	status: inactive\nbridge0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	options=63<RXCSUM,TXCSUM,TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	Configuration:\n		id 0:0:0:0:0:0 priority 0 hellotime 0 fwddelay 0\n		maxage 0 holdcnt 0 proto stp maxaddr 100 timeout 1200\n		root id 0:0:0:0:0:0 priority 0 ifcost 0 port 0\n		ipfilter disabled flags 0x2\n	member: en1 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 8 priority 0 path cost 0\n	member: en2 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 9 priority 0 path cost 0\n	nd6 options=201<PERFORMNUD,DAD>\n	media: <unknown type>\n	status: inactive\nutun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000\n	inet6 fe80::d0c4:a697:d252:67df%utun0 prefixlen 64 scopeid 0xb \n	nd6 options=201<PERFORMNUD,DAD>\nutun1: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::5177:a768:4d4d:c4fa%utun1 prefixlen 64 scopeid 0xc \n	nd6 options=201<PERFORMNUD,DAD>\nutun2: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::e1b5:3dd8:2699:2482%utun2 prefixlen 64 scopeid 0xd \n	nd6 options=201<PERFORMNUD,DAD>\nen4: flags=8822<BROADCAST,SMART,SIMPLEX,MULTICAST> mtu 1500\n	ether 9e:e3:3f:8a:6a:94 \n	media: autoselect <full-duplex>\n	status: inactive\n', '', 0, 14, 1534923025),
(3, 1, 'lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384\n	options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>\n	inet 127.0.0.1 netmask 0xff000000 \n	inet6 ::1 prefixlen 128 \n	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 \n	nd6 options=201<PERFORMNUD,DAD>\ngif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280\nstf0: flags=0<> mtu 1280\nXHC20: flags=0<> mtu 0\nen0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	ether 4c:32:75:8b:cb:35 \n	inet6 fe80::d9:73f3:6762:e80a%en0 prefixlen 64 secured scopeid 0x5 \n	inet 172.30.16.62 netmask 0xffffff00 broadcast 172.30.16.255\n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\np2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304\n	ether 0e:32:75:8b:cb:35 \n	media: autoselect\n	status: inactive\nawdl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1484\n	ether 0e:11:63:b6:93:a4 \n	inet6 fe80::c11:63ff:feb6:93a4%awdl0 prefixlen 64 scopeid 0x7 \n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\nen1: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	media: autoselect <full-duplex>\n	status: inactive\nen2: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d1 \n	media: autoselect <full-duplex>\n	status: inactive\nbridge0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	options=63<RXCSUM,TXCSUM,TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	Configuration:\n		id 0:0:0:0:0:0 priority 0 hellotime 0 fwddelay 0\n		maxage 0 holdcnt 0 proto stp maxaddr 100 timeout 1200\n		root id 0:0:0:0:0:0 priority 0 ifcost 0 port 0\n		ipfilter disabled flags 0x2\n	member: en1 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 8 priority 0 path cost 0\n	member: en2 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 9 priority 0 path cost 0\n	nd6 options=201<PERFORMNUD,DAD>\n	media: <unknown type>\n	status: inactive\nutun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000\n	inet6 fe80::d0c4:a697:d252:67df%utun0 prefixlen 64 scopeid 0xb \n	nd6 options=201<PERFORMNUD,DAD>\nutun1: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::5177:a768:4d4d:c4fa%utun1 prefixlen 64 scopeid 0xc \n	nd6 options=201<PERFORMNUD,DAD>\nutun2: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::e1b5:3dd8:2699:2482%utun2 prefixlen 64 scopeid 0xd \n	nd6 options=201<PERFORMNUD,DAD>\nen4: flags=8822<BROADCAST,SMART,SIMPLEX,MULTICAST> mtu 1500\n	ether 9e:e3:3f:8a:6a:94 \n	media: autoselect <full-duplex>\n	status: inactive\n', '', 0, 12, 1534923030),
(4, 1, 'lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384\n	options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>\n	inet 127.0.0.1 netmask 0xff000000 \n	inet6 ::1 prefixlen 128 \n	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 \n	nd6 options=201<PERFORMNUD,DAD>\ngif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280\nstf0: flags=0<> mtu 1280\nXHC20: flags=0<> mtu 0\nen0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	ether 4c:32:75:8b:cb:35 \n	inet6 fe80::d9:73f3:6762:e80a%en0 prefixlen 64 secured scopeid 0x5 \n	inet 172.30.16.62 netmask 0xffffff00 broadcast 172.30.16.255\n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\np2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304\n	ether 0e:32:75:8b:cb:35 \n	media: autoselect\n	status: inactive\nawdl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1484\n	ether 0e:11:63:b6:93:a4 \n	inet6 fe80::c11:63ff:feb6:93a4%awdl0 prefixlen 64 scopeid 0x7 \n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\nen1: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	media: autoselect <full-duplex>\n	status: inactive\nen2: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d1 \n	media: autoselect <full-duplex>\n	status: inactive\nbridge0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	options=63<RXCSUM,TXCSUM,TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	Configuration:\n		id 0:0:0:0:0:0 priority 0 hellotime 0 fwddelay 0\n		maxage 0 holdcnt 0 proto stp maxaddr 100 timeout 1200\n		root id 0:0:0:0:0:0 priority 0 ifcost 0 port 0\n		ipfilter disabled flags 0x2\n	member: en1 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 8 priority 0 path cost 0\n	member: en2 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 9 priority 0 path cost 0\n	nd6 options=201<PERFORMNUD,DAD>\n	media: <unknown type>\n	status: inactive\nutun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000\n	inet6 fe80::d0c4:a697:d252:67df%utun0 prefixlen 64 scopeid 0xb \n	nd6 options=201<PERFORMNUD,DAD>\nutun1: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::5177:a768:4d4d:c4fa%utun1 prefixlen 64 scopeid 0xc \n	nd6 options=201<PERFORMNUD,DAD>\nutun2: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::e1b5:3dd8:2699:2482%utun2 prefixlen 64 scopeid 0xd \n	nd6 options=201<PERFORMNUD,DAD>\nen4: flags=8822<BROADCAST,SMART,SIMPLEX,MULTICAST> mtu 1500\n	ether 9e:e3:3f:8a:6a:94 \n	media: autoselect <full-duplex>\n	status: inactive\n', '', 0, 12, 1534923035),
(5, 1, 'lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384\n	options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>\n	inet 127.0.0.1 netmask 0xff000000 \n	inet6 ::1 prefixlen 128 \n	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 \n	nd6 options=201<PERFORMNUD,DAD>\ngif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280\nstf0: flags=0<> mtu 1280\nXHC20: flags=0<> mtu 0\nen0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	ether 4c:32:75:8b:cb:35 \n	inet6 fe80::d9:73f3:6762:e80a%en0 prefixlen 64 secured scopeid 0x5 \n	inet 172.30.16.62 netmask 0xffffff00 broadcast 172.30.16.255\n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\np2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304\n	ether 0e:32:75:8b:cb:35 \n	media: autoselect\n	status: inactive\nawdl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1484\n	ether 0e:11:63:b6:93:a4 \n	inet6 fe80::c11:63ff:feb6:93a4%awdl0 prefixlen 64 scopeid 0x7 \n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\nen1: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	media: autoselect <full-duplex>\n	status: inactive\nen2: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d1 \n	media: autoselect <full-duplex>\n	status: inactive\nbridge0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	options=63<RXCSUM,TXCSUM,TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	Configuration:\n		id 0:0:0:0:0:0 priority 0 hellotime 0 fwddelay 0\n		maxage 0 holdcnt 0 proto stp maxaddr 100 timeout 1200\n		root id 0:0:0:0:0:0 priority 0 ifcost 0 port 0\n		ipfilter disabled flags 0x2\n	member: en1 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 8 priority 0 path cost 0\n	member: en2 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 9 priority 0 path cost 0\n	nd6 options=201<PERFORMNUD,DAD>\n	media: <unknown type>\n	status: inactive\nutun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000\n	inet6 fe80::d0c4:a697:d252:67df%utun0 prefixlen 64 scopeid 0xb \n	nd6 options=201<PERFORMNUD,DAD>\nutun1: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::5177:a768:4d4d:c4fa%utun1 prefixlen 64 scopeid 0xc \n	nd6 options=201<PERFORMNUD,DAD>\nutun2: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::e1b5:3dd8:2699:2482%utun2 prefixlen 64 scopeid 0xd \n	nd6 options=201<PERFORMNUD,DAD>\nen4: flags=8822<BROADCAST,SMART,SIMPLEX,MULTICAST> mtu 1500\n	ether 9e:e3:3f:8a:6a:94 \n	media: autoselect <full-duplex>\n	status: inactive\n', '', 0, 11, 1534923040),
(6, 1, 'lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384\n	options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>\n	inet 127.0.0.1 netmask 0xff000000 \n	inet6 ::1 prefixlen 128 \n	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 \n	nd6 options=201<PERFORMNUD,DAD>\ngif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280\nstf0: flags=0<> mtu 1280\nXHC20: flags=0<> mtu 0\nen0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	ether 4c:32:75:8b:cb:35 \n	inet6 fe80::d9:73f3:6762:e80a%en0 prefixlen 64 secured scopeid 0x5 \n	inet 172.30.16.62 netmask 0xffffff00 broadcast 172.30.16.255\n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\np2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304\n	ether 0e:32:75:8b:cb:35 \n	media: autoselect\n	status: inactive\nawdl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1484\n	ether 0e:11:63:b6:93:a4 \n	inet6 fe80::c11:63ff:feb6:93a4%awdl0 prefixlen 64 scopeid 0x7 \n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\nen1: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	media: autoselect <full-duplex>\n	status: inactive\nen2: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d1 \n	media: autoselect <full-duplex>\n	status: inactive\nbridge0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	options=63<RXCSUM,TXCSUM,TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	Configuration:\n		id 0:0:0:0:0:0 priority 0 hellotime 0 fwddelay 0\n		maxage 0 holdcnt 0 proto stp maxaddr 100 timeout 1200\n		root id 0:0:0:0:0:0 priority 0 ifcost 0 port 0\n		ipfilter disabled flags 0x2\n	member: en1 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 8 priority 0 path cost 0\n	member: en2 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 9 priority 0 path cost 0\n	nd6 options=201<PERFORMNUD,DAD>\n	media: <unknown type>\n	status: inactive\nutun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000\n	inet6 fe80::d0c4:a697:d252:67df%utun0 prefixlen 64 scopeid 0xb \n	nd6 options=201<PERFORMNUD,DAD>\nutun1: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::5177:a768:4d4d:c4fa%utun1 prefixlen 64 scopeid 0xc \n	nd6 options=201<PERFORMNUD,DAD>\nutun2: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::e1b5:3dd8:2699:2482%utun2 prefixlen 64 scopeid 0xd \n	nd6 options=201<PERFORMNUD,DAD>\nen4: flags=8822<BROADCAST,SMART,SIMPLEX,MULTICAST> mtu 1500\n	ether 9e:e3:3f:8a:6a:94 \n	media: autoselect <full-duplex>\n	status: inactive\n', '', 0, 11, 1534923045),
(7, 1, 'lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384\n	options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>\n	inet 127.0.0.1 netmask 0xff000000 \n	inet6 ::1 prefixlen 128 \n	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 \n	nd6 options=201<PERFORMNUD,DAD>\ngif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280\nstf0: flags=0<> mtu 1280\nXHC20: flags=0<> mtu 0\nen0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	ether 4c:32:75:8b:cb:35 \n	inet6 fe80::d9:73f3:6762:e80a%en0 prefixlen 64 secured scopeid 0x5 \n	inet 172.30.16.62 netmask 0xffffff00 broadcast 172.30.16.255\n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\np2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304\n	ether 0e:32:75:8b:cb:35 \n	media: autoselect\n	status: inactive\nawdl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1484\n	ether 0e:11:63:b6:93:a4 \n	inet6 fe80::c11:63ff:feb6:93a4%awdl0 prefixlen 64 scopeid 0x7 \n	nd6 options=201<PERFORMNUD,DAD>\n	media: autoselect\n	status: active\nen1: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	media: autoselect <full-duplex>\n	status: inactive\nen2: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500\n	options=60<TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d1 \n	media: autoselect <full-duplex>\n	status: inactive\nbridge0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500\n	options=63<RXCSUM,TXCSUM,TSO4,TSO6>\n	ether 4a:00:07:e1:ed:d0 \n	Configuration:\n		id 0:0:0:0:0:0 priority 0 hellotime 0 fwddelay 0\n		maxage 0 holdcnt 0 proto stp maxaddr 100 timeout 1200\n		root id 0:0:0:0:0:0 priority 0 ifcost 0 port 0\n		ipfilter disabled flags 0x2\n	member: en1 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 8 priority 0 path cost 0\n	member: en2 flags=3<LEARNING,DISCOVER>\n	        ifmaxaddr 0 port 9 priority 0 path cost 0\n	nd6 options=201<PERFORMNUD,DAD>\n	media: <unknown type>\n	status: inactive\nutun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000\n	inet6 fe80::d0c4:a697:d252:67df%utun0 prefixlen 64 scopeid 0xb \n	nd6 options=201<PERFORMNUD,DAD>\nutun1: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::5177:a768:4d4d:c4fa%utun1 prefixlen 64 scopeid 0xc \n	nd6 options=201<PERFORMNUD,DAD>\nutun2: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380\n	inet6 fe80::e1b5:3dd8:2699:2482%utun2 prefixlen 64 scopeid 0xd \n	nd6 options=201<PERFORMNUD,DAD>\nen4: flags=8822<BROADCAST,SMART,SIMPLEX,MULTICAST> mtu 1500\n	ether 9e:e3:3f:8a:6a:94 \n	media: autoselect <full-duplex>\n	status: inactive\n', '', 0, 12, 1534923050);

-- --------------------------------------------------------

--
-- 表的结构 `pp_task_server`
--

CREATE TABLE `pp_task_server` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增ID',
  `group_id` int(64) NOT NULL,
  `server_name` varchar(64) NOT NULL DEFAULT '0' COMMENT '服务器名称',
  `server_account` varchar(32) NOT NULL DEFAULT 'root' COMMENT '账户名称',
  `server_outer_ip` varchar(20) NOT NULL DEFAULT '0' COMMENT '外网IP',
  `server_ip` varchar(20) NOT NULL DEFAULT '0' COMMENT '服务器内网IP',
  `port` int(4) UNSIGNED NOT NULL DEFAULT '22' COMMENT '服务器端口',
  `password` varchar(64) NOT NULL DEFAULT '0' COMMENT '服务器密码',
  `private_key_src` varchar(128) NOT NULL DEFAULT '0' COMMENT '私钥文件地址',
  `public_key_src` varchar(128) NOT NULL DEFAULT '0' COMMENT '公钥地址',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录类型：0-密码登录，1-私钥登录',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态：0-正常，1-删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务器列表';

--
-- 转存表中的数据 `pp_task_server`
--

INSERT INTO `pp_task_server` (`id`, `group_id`, `server_name`, `server_account`, `server_outer_ip`, `server_ip`, `port`, `password`, `private_key_src`, `public_key_src`, `type`, `detail`, `create_time`, `update_time`, `status`) VALUES
(1, 2, '密钥验证服务器', 'root', '0', '172.16.210.168', 22, '', '/Users/haodaquan/.ssh/my_service', '/Users/haodaquan/.ssh/my_service.pub', 1, '远程服务器示例', 1531642563, 1534921334, 1),
(2, 1, '本机', 'root', '0', '120.0.0.1', 22, '1222', '', '', 0, '这是密码验证服务器', 1502945869, 1534921337, 1),
(3, 3, '测试服务器', 'root', '0', '172.16.210.153', 22, 'haodaquan2008', '', '', 0, '测试服务器', 1531641591, 1534921339, 1);

-- --------------------------------------------------------

--
-- 表的结构 `pp_task_server_group`
--

CREATE TABLE `pp_task_server_group` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '组名',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1-正常，0-删除',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pp_task_server_group`
--

INSERT INTO `pp_task_server_group` (`id`, `group_name`, `description`, `status`, `create_time`, `update_time`, `create_id`, `update_id`) VALUES
(1, '本机', 'localhost', 0, 0, 1534921348, 0, 1),
(2, '资源B组', '服务器B组', 0, 1531617507, 1534921351, 1, 1),
(3, '资源C组', '资源C组', 0, 1531617530, 1534921354, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `pp_uc_admin`
--

CREATE TABLE `pp_uc_admin` (
  `id` int(11) UNSIGNED NOT NULL,
  `login_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '真实姓名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `role_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '角色id字符串，如：2,3,4',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

--
-- 转存表中的数据 `pp_uc_admin`
--

INSERT INTO `pp_uc_admin` (`id`, `login_name`, `real_name`, `password`, `role_ids`, `phone`, `email`, `salt`, `last_login`, `last_ip`, `status`, `create_id`, `update_id`, `create_time`, `update_time`) VALUES
(1, 'admin', '超级管理员', 'f501c81f200f546ca150afcf893d3ceb', '0', '18952015277', 'ww@alon.pro', 'zz9H', 1534920461, '127.0.0.1', 1, 0, 1, 0, 1534919937);

-- --------------------------------------------------------

--
-- 表的结构 `pp_uc_auth`
--

CREATE TABLE `pp_uc_auth` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增ID',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级ID，0为顶级',
  `auth_name` varchar(64) NOT NULL DEFAULT '0' COMMENT '权限名称',
  `auth_url` varchar(255) NOT NULL DEFAULT '0' COMMENT 'URL地址',
  `sort` int(1) UNSIGNED NOT NULL DEFAULT '999' COMMENT '排序，越小越前',
  `icon` varchar(255) NOT NULL,
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否显示，0-隐藏，1-显示',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-删除',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限因子';

--
-- 转存表中的数据 `pp_uc_auth`
--

INSERT INTO `pp_uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES
(1, 0, '所有权限', '/', 1, '', 0, 1, 1, 1, 1, 1505620970, 1505620970),
(2, 1, '权限管理', '/', 999, 'fa-id-card', 1, 1, 0, 1, 1, 0, 1505622360),
(3, 2, '用户管理', '/admin/list', 1, 'fa-user-o', 1, 0, 0, 0, 1, 0, 1528385411),
(4, 2, '角色管理', '/role/list', 2, 'fa-user-circle-o', 1, 1, 0, 1, 1, 0, 1505621852),
(5, 3, '新增', '/admin/add', 1, '', 0, 1, 0, 1, 1, 0, 1505621685),
(6, 3, '修改', '/admin/edit', 2, '', 0, 1, 0, 1, 1, 0, 1505621697),
(7, 3, '删除', '/admin/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505621756, 1505621756),
(8, 4, '新增', '/role/add', 1, '', 1, 1, 0, 1, 1, 0, 1505698716),
(9, 4, '修改', '/role/edit', 2, '', 0, 1, 1, 1, 1, 1505621912, 1505621912),
(10, 4, '删除', '/role/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505621951, 1505621951),
(11, 2, '权限因子', '/auth/list', 3, 'fa-list', 1, 1, 1, 1, 1, 1505621986, 1505621986),
(12, 11, '新增', '/auth/add', 1, '', 0, 1, 1, 1, 1, 1505622009, 1505622009),
(13, 11, '修改', '/auth/edit', 2, '', 0, 1, 1, 1, 1, 1505622047, 1505622047),
(14, 11, '删除', '/auth/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505622111, 1505622111),
(15, 1, '个人中心', 'profile/edit', 1001, 'fa-user-circle-o', 1, 1, 0, 1, 1, 0, 1506001114),
(16, 15, '资料修改', '/user/edit', 1, 'fa-edit', 1, 0, 0, 0, 1, 1528385551, 1528385551),
(17, 1, '基本设置', '/', 2, 'fa-cogs', 1, 1, 0, 1, 1, 0, 1528464467),
(18, 17, '资源分组', '/servergroup/list', 2, 'fa-cubes', 1, 1, 0, 1, 1, 0, 1528466663),
(19, 17, '资源管理', '/server/list', 1, 'fa-cube', 1, 1, 0, 1, 1, 0, 1528464498),
(20, 17, '禁用命令', '/ban/list', 3, 'fa-exclamation-triangle', 1, 1, 0, 1, 1, 0, 1528464656),
(21, 18, '新增', '/servergroup/add', 1, '', 0, 1, 0, 1, 1, 0, 1528466669),
(22, 18, '修改', '/servergroup/edit', 2, '', 0, 1, 0, 1, 1, 0, 1528466675),
(23, 18, '删除', '/servergroup/ajaxdel', 3, '', 0, 1, 0, 1, 1, 0, 1528466684),
(24, 19, '新增', '/server/add', 1, '', 0, 1, 1, 1, 1, 1528464882, 1528464882),
(25, 19, '修改', '/server/edit', 2, '', 0, 1, 1, 1, 1, 1528464904, 1528464904),
(26, 19, '删除', '/server/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1528464937, 1528464937),
(27, 20, '新增', '/ban/add', 1, '', 0, 1, 1, 1, 1, 1528464977, 1528464977),
(28, 20, '修改', '/ban/edit', 2, '', 0, 1, 1, 1, 1, 1528465005, 1528465005),
(29, 20, '删除', '/ban/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1528465036, 1528465036),
(30, 1, '任务管理', '/job/list', 1, 'fa-tasks', 1, 1, 1, 1, 1, 1528639988, 1528639988),
(31, 30, '任务列表', '/task/list', 1, 'fa-object-ungroup', 1, 1, 0, 1, 1, 0, 1531212830),
(32, 30, '任务分组', '/group/list', 3, 'fa-object-group', 1, 1, 0, 1, 1, 0, 1531212219),
(33, 32, '新增', '/group/add', 1, '', 0, 1, 1, 1, 1, 1528640546, 1528640546),
(34, 32, '编辑', '/group/edit', 2, '', 0, 1, 1, 1, 1, 1528640572, 1528640572),
(35, 32, '删除', '/group/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1528640604, 1528640604),
(36, 31, '新增', '/task/add', 1, '', 0, 1, 1, 1, 1, 1528728220, 1528728220),
(37, 31, '编辑', '/task/edit', 2, '', 0, 1, 1, 1, 1, 1528728251, 1528728251),
(38, 42, '删除', '/task/ajaxdel', 3, '', 0, 1, 0, 1, 1, 0, 1531279999),
(39, 31, '查看', '/task/detail', 3, '', 0, 1, 0, 1, 1, 0, 1531279407),
(40, 42, '审核通过', '/task/ajaxaudit', 5, '', 0, 1, 0, 1, 1, 0, 1531466535),
(41, 31, '复制', '/task/copy', 5, '', 0, 1, 0, 1, 1, 0, 1531286150),
(42, 30, '任务审核', '/task/auditlist', 2, 'fa-gavel', 1, 1, 0, 1, 1, 0, 1531212806),
(43, 42, '批量审核通过', '/task/ajaxbatchaudit', 1, '', 0, 1, 0, 1, 1, 0, 1531466506),
(44, 42, '批量审核不通过', '/task/ajaxbatchnopass', 2, '', 0, 1, 0, 1, 1, 0, 1531466513),
(45, 31, '测试执行', '/task/ajaxrun', 4, '', 0, 1, 0, 1, 1, 0, 1531446085),
(46, 31, '批量暂停', '/task/ajaxbatchpause', 9, '', 0, 1, 0, 1, 1, 0, 1531466394),
(47, 31, '批量开启', '/task/ajaxbatchstart', 6, '', 0, 1, 0, 1, 1, 0, 1531466385),
(48, 31, '开启', '/task/ajaxstart', 7, '', 0, 1, 0, 1, 1, 0, 1531466404),
(49, 31, '暂停', '/task/ajaxpause', 8, '', 0, 1, 0, 1, 1, 0, 1531466411),
(50, 42, '审核不通过', '/task/ajaxnopass', 6, '', 0, 1, 0, 1, 1, 0, 1531466546),
(51, 42, '批量删除', '/task/ajaxbatchdel', 4, '', 0, 1, 0, 1, 1, 0, 1531466528),
(52, 19, '复制', '/server/copy', 3, '', 0, 1, 1, 1, 1, 1531383393, 1531383393),
(53, 19, '测试', '/server/ajaxtestserver', 5, '', 0, 1, 0, 1, 1, 0, 1531466851),
(54, 1, '日志管理', '/tasklog/list', 10, 'fa-file-text-o', 0, 1, 1, 1, 1, 1531389296, 1531389296),
(55, 54, '详情', '/tasklog/detail', 1, '', 0, 1, 1, 1, 1, 1531389347, 1531389347),
(56, 54, '删除', '/tasklog/ajaxdel', 2, '', 0, 1, 0, 1, 1, 0, 1531466707),
(57, 17, '提醒设置', '/remind/list', 4, 'fa-bell-o', 1, 1, 1, 1, 0, 1533607960, 1533607960),
(58, 57, '新增', '/remind/add', 1, '', 0, 1, 1, 1, 1, 1533608257, 1533608257),
(59, 57, '编辑', '/remind/edit', 2, '', 0, 1, 1, 1, 1, 1533608298, 1533608298),
(60, 57, '删除', '/remind/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1533608395, 1533608395);

-- --------------------------------------------------------

--
-- 表的结构 `pp_uc_role`
--

CREATE TABLE `pp_uc_role` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键ID',
  `role_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '角色名称',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `server_group_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '服务器分组权限ids,1,2,3',
  `task_group_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '任务分组权限ids ,1,2,32',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改这ID',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态1-正常，0-删除',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

--
-- 转存表中的数据 `pp_uc_role`
--

INSERT INTO `pp_uc_role` (`id`, `role_name`, `detail`, `server_group_ids`, `task_group_ids`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES
(1, '普通管理员', '可以运行和关闭任务', '10,1', '4,1', 0, 1, 1, 1531705962, 1531705962),
(2, '高级管理员', '可以批量操作任务，创建任务，创建任务分组，审核任务等', ',10,1,2', '4,6,1,2', 0, 1, 1, 1533607237, 1533607237),
(3, '资深管理员', '系统配置，任务管理等', '1,2,3', '2,1,3', 0, 1, 1, 1531644877, 1531644877);

-- --------------------------------------------------------

--
-- 表的结构 `pp_uc_role_auth`
--

CREATE TABLE `pp_uc_role_auth` (
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '角色ID',
  `auth_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限和角色关系表';

--
-- 转存表中的数据 `pp_uc_role_auth`
--

INSERT INTO `pp_uc_role_auth` (`role_id`, `auth_id`) VALUES
(1, 1),
(1, 15),
(1, 16),
(1, 30),
(1, 31),
(1, 36),
(1, 37),
(1, 39),
(1, 41),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 54),
(1, 55),
(1, 56),
(2, 0),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 38),
(2, 40),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 50),
(2, 51),
(2, 52),
(2, 53);

-- --------------------------------------------------------

--
-- 表的结构 `pp_user`
--

CREATE TABLE `pp_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0正常 -1禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pp_user`
--

INSERT INTO `pp_user` (`id`, `user_name`, `email`, `password`, `salt`, `last_login`, `last_ip`, `status`) VALUES
(1, 'admin', 'haodaquan@shoplinq.cn', 'abfcf6dcedfb4b5b1505d41a8b4c77e8', 'aYk4Q1P83v', 1528124357, '[', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `default`
--
ALTER TABLE `default`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_name` (`user_name`);

--
-- Indexes for table `pp_task`
--
ALTER TABLE `pp_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_group_id` (`group_id`);

--
-- Indexes for table `pp_task_ban`
--
ALTER TABLE `pp_task_ban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_task_group`
--
ALTER TABLE `pp_task_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`create_id`);

--
-- Indexes for table `pp_task_log`
--
ALTER TABLE `pp_task_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_task_id` (`task_id`,`create_time`);

--
-- Indexes for table `pp_task_server`
--
ALTER TABLE `pp_task_server`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_task_server_group`
--
ALTER TABLE `pp_task_server_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`create_id`);

--
-- Indexes for table `pp_uc_admin`
--
ALTER TABLE `pp_uc_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_name` (`login_name`);

--
-- Indexes for table `pp_uc_auth`
--
ALTER TABLE `pp_uc_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_uc_role`
--
ALTER TABLE `pp_uc_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_uc_role_auth`
--
ALTER TABLE `pp_uc_role_auth`
  ADD PRIMARY KEY (`role_id`,`auth_id`);

--
-- Indexes for table `pp_user`
--
ALTER TABLE `pp_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_name` (`user_name`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `default`
--
ALTER TABLE `default`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pp_task`
--
ALTER TABLE `pp_task`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pp_task_ban`
--
ALTER TABLE `pp_task_ban`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `pp_task_group`
--
ALTER TABLE `pp_task_group`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `pp_task_log`
--
ALTER TABLE `pp_task_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `pp_task_server`
--
ALTER TABLE `pp_task_server`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `pp_task_server_group`
--
ALTER TABLE `pp_task_server_group`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `pp_uc_admin`
--
ALTER TABLE `pp_uc_admin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pp_uc_auth`
--
ALTER TABLE `pp_uc_auth`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=61;

--
-- 使用表AUTO_INCREMENT `pp_uc_role`
--
ALTER TABLE `pp_uc_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `pp_user`
--
ALTER TABLE `pp_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

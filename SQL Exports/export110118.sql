-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `watermelon`;
CREATE DATABASE `watermelon` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `watermelon`;

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1,	1,	'A WordPress Commenter',	'wapuu@wordpress.example',	'https://wordpress.org/',	'',	'2018-10-20 11:07:57',	'2018-10-20 11:07:57',	'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',	0,	'1',	'',	'',	0,	0)
ON DUPLICATE KEY UPDATE `comment_ID` = VALUES(`comment_ID`), `comment_post_ID` = VALUES(`comment_post_ID`), `comment_author` = VALUES(`comment_author`), `comment_author_email` = VALUES(`comment_author_email`), `comment_author_url` = VALUES(`comment_author_url`), `comment_author_IP` = VALUES(`comment_author_IP`), `comment_date` = VALUES(`comment_date`), `comment_date_gmt` = VALUES(`comment_date_gmt`), `comment_content` = VALUES(`comment_content`), `comment_karma` = VALUES(`comment_karma`), `comment_approved` = VALUES(`comment_approved`), `comment_agent` = VALUES(`comment_agent`), `comment_type` = VALUES(`comment_type`), `comment_parent` = VALUES(`comment_parent`), `user_id` = VALUES(`user_id`);

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1,	'siteurl',	'http://localhost:3157/watermelon',	'yes'),
(2,	'home',	'http://localhost:3157/watermelon',	'yes'),
(3,	'blogname',	'',	'yes'),
(4,	'blogdescription',	'',	'yes'),
(5,	'users_can_register',	'0',	'yes'),
(6,	'admin_email',	'salee15@student.monash.edu',	'yes'),
(7,	'start_of_week',	'1',	'yes'),
(8,	'use_balanceTags',	'0',	'yes'),
(9,	'use_smilies',	'1',	'yes'),
(10,	'require_name_email',	'1',	'yes'),
(11,	'comments_notify',	'1',	'yes'),
(12,	'posts_per_rss',	'10',	'yes'),
(13,	'rss_use_excerpt',	'0',	'yes'),
(14,	'mailserver_url',	'mail.example.com',	'yes'),
(15,	'mailserver_login',	'login@example.com',	'yes'),
(16,	'mailserver_pass',	'password',	'yes'),
(17,	'mailserver_port',	'110',	'yes'),
(18,	'default_category',	'1',	'yes'),
(19,	'default_comment_status',	'open',	'yes'),
(20,	'default_ping_status',	'open',	'yes'),
(21,	'default_pingback_flag',	'0',	'yes'),
(22,	'posts_per_page',	'10',	'yes'),
(23,	'date_format',	'F j, Y',	'yes'),
(24,	'time_format',	'g:i a',	'yes'),
(25,	'links_updated_date_format',	'F j, Y g:i a',	'yes'),
(26,	'comment_moderation',	'0',	'yes'),
(27,	'moderation_notify',	'1',	'yes'),
(28,	'permalink_structure',	'',	'yes'),
(29,	'rewrite_rules',	'',	'yes'),
(30,	'hack_file',	'0',	'yes'),
(31,	'blog_charset',	'UTF-8',	'yes'),
(32,	'moderation_keys',	'',	'no'),
(33,	'active_plugins',	'a:4:{i:0;s:65:\"blossomthemes-email-newsletter/blossomthemes-email-newsletter.php\";i:1;s:61:\"blossomthemes-instagram-feed/blossomthemes-instagram-feed.php\";i:2;s:47:\"blossomthemes-toolkit/blossomthemes-toolkit.php\";i:3;s:27:\"woocommerce/woocommerce.php\";}',	'yes'),
(34,	'category_base',	'',	'yes'),
(35,	'ping_sites',	'http://rpc.pingomatic.com/',	'yes'),
(36,	'comment_max_links',	'2',	'yes'),
(37,	'gmt_offset',	'0',	'yes'),
(38,	'default_email_category',	'1',	'yes'),
(39,	'recently_edited',	'',	'no'),
(40,	'template',	'watermelon',	'yes'),
(41,	'stylesheet',	'watermelon',	'yes'),
(42,	'comment_whitelist',	'1',	'yes'),
(43,	'blacklist_keys',	'',	'no'),
(44,	'comment_registration',	'0',	'yes'),
(45,	'html_type',	'text/html',	'yes'),
(46,	'use_trackback',	'0',	'yes'),
(47,	'default_role',	'subscriber',	'yes'),
(48,	'db_version',	'38590',	'yes'),
(49,	'uploads_use_yearmonth_folders',	'1',	'yes'),
(50,	'upload_path',	'',	'yes'),
(51,	'blog_public',	'0',	'yes'),
(52,	'default_link_category',	'2',	'yes'),
(53,	'show_on_front',	'posts',	'yes'),
(54,	'tag_base',	'',	'yes'),
(55,	'show_avatars',	'1',	'yes'),
(56,	'avatar_rating',	'G',	'yes'),
(57,	'upload_url_path',	'',	'yes'),
(58,	'thumbnail_size_w',	'150',	'yes'),
(59,	'thumbnail_size_h',	'150',	'yes'),
(60,	'thumbnail_crop',	'1',	'yes'),
(61,	'medium_size_w',	'300',	'yes'),
(62,	'medium_size_h',	'300',	'yes'),
(63,	'avatar_default',	'mystery',	'yes'),
(64,	'large_size_w',	'1024',	'yes'),
(65,	'large_size_h',	'1024',	'yes'),
(66,	'image_default_link_type',	'none',	'yes'),
(67,	'image_default_size',	'',	'yes'),
(68,	'image_default_align',	'',	'yes'),
(69,	'close_comments_for_old_posts',	'0',	'yes'),
(70,	'close_comments_days_old',	'14',	'yes'),
(71,	'thread_comments',	'1',	'yes'),
(72,	'thread_comments_depth',	'5',	'yes'),
(73,	'page_comments',	'0',	'yes'),
(74,	'comments_per_page',	'50',	'yes'),
(75,	'default_comments_page',	'newest',	'yes'),
(76,	'comment_order',	'asc',	'yes'),
(77,	'sticky_posts',	'a:0:{}',	'yes'),
(78,	'widget_categories',	'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(79,	'widget_text',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(80,	'widget_rss',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(81,	'uninstall_plugins',	'a:0:{}',	'no'),
(82,	'timezone_string',	'',	'yes'),
(83,	'page_for_posts',	'0',	'yes'),
(84,	'page_on_front',	'0',	'yes'),
(85,	'default_post_format',	'0',	'yes'),
(86,	'link_manager_enabled',	'0',	'yes'),
(87,	'finished_splitting_shared_terms',	'1',	'yes'),
(88,	'site_icon',	'0',	'yes'),
(89,	'medium_large_size_w',	'768',	'yes'),
(90,	'medium_large_size_h',	'0',	'yes'),
(91,	'wp_page_for_privacy_policy',	'3',	'yes'),
(92,	'show_comments_cookies_opt_in',	'0',	'yes'),
(93,	'initial_db_version',	'38590',	'yes'),
(94,	'wp_user_roles',	'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:114:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:92:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}}',	'yes'),
(95,	'fresh_site',	'0',	'yes'),
(96,	'widget_search',	'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}',	'yes'),
(97,	'widget_recent-posts',	'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(98,	'widget_recent-comments',	'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(99,	'widget_archives',	'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(100,	'widget_meta',	'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}',	'yes'),
(101,	'sidebars_widgets',	'a:2:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}',	'yes'),
(110,	'widget_custom_html',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(111,	'cron',	'a:12:{i:1541034901;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1541035386;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1541043942;a:1:{s:33:\"woocommerce_cleanup_personal_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1541043952;a:1:{s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1541053292;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1541054742;a:1:{s:24:\"woocommerce_cleanup_logs\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1541065542;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1541070901;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1541070921;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1541116800;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1541462400;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:7:\"monthly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:2635200;}}}s:7:\"version\";i:2;}',	'yes'),
(113,	'_site_transient_update_core',	'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1541027806;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}',	'no'),
(574,	'_site_transient_timeout_theme_roots',	'1541029607',	'no'),
(575,	'_site_transient_theme_roots',	'a:3:{s:15:\"blossom-fashion\";s:7:\"/themes\";s:12:\"fashion-icon\";s:7:\"/themes\";s:10:\"watermelon\";s:7:\"/themes\";}',	'no'),
(156,	'theme_mods_twentyseventeen',	'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1540179396;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}',	'yes'),
(102,	'widget_pages',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(103,	'widget_calendar',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(104,	'widget_media_audio',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(105,	'widget_media_image',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(106,	'widget_media_gallery',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(107,	'widget_media_video',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(108,	'widget_tag_cloud',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(109,	'widget_nav_menu',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(500,	'theme_mods_watermelon',	'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1541008349;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}',	'yes'),
(478,	'_transient_timeout_wc_report_sales_by_date',	'1541092762',	'no'),
(519,	'_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca',	'1541049568',	'no'),
(520,	'_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca',	'1541049568',	'no'),
(521,	'_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca',	'1541006368',	'no'),
(548,	'_transient_timeout__woocommerce_helper_subscriptions',	'1541009061',	'no'),
(535,	'_transient_timeout__woocommerce_helper_updates',	'1541049695',	'no'),
(536,	'_transient__woocommerce_helper_updates',	'a:4:{s:4:\"hash\";s:32:\"d751713988987e9331980363e24189ce\";s:7:\"updated\";i:1541006495;s:8:\"products\";a:0:{}s:6:\"errors\";a:1:{i:0;s:10:\"http-error\";}}',	'no'),
(479,	'_transient_wc_report_sales_by_date',	'a:16:{s:32:\"f5a18472ceeb5044c12443b8f63d8f69\";a:0:{}s:32:\"f80fa9eb79e44ad10f5a13741ae814fe\";a:0:{}s:32:\"031aa7e06e662ac4512f1b77ec2a9006\";a:0:{}s:32:\"9a30219dbe3d1d92eabfec9e7dfec68d\";N;s:32:\"d4027faab09304bb38047bfaee650362\";a:0:{}s:32:\"0810ead44b47abc489cff6015edc82db\";a:0:{}s:32:\"27493b827ff2a0744de49e45a512c996\";a:0:{}s:32:\"b5fe99eb0ed8955d3ec6bed86ab1fbd1\";a:0:{}s:32:\"a104cab71b63f9e033b0f8a25ad22976\";a:0:{}s:32:\"57d82281276e2a4daf89854c29f10af0\";a:0:{}s:32:\"de01286c60f1ddfae27893400e48133d\";a:0:{}s:32:\"3a9c3257bcb0314ac37e3f59dbe1888a\";N;s:32:\"ca1cb1ec739b18287478e5ad0d877f48\";a:0:{}s:32:\"786977d2210156911cd079cdaeaf7598\";a:0:{}s:32:\"bf250445ce796c248a7c97107d91f1d6\";a:0:{}s:32:\"2383f8966be69926f1fb39e447193596\";a:0:{}}',	'no'),
(480,	'_transient_timeout_wc_admin_report',	'1541028142',	'no'),
(481,	'_transient_wc_admin_report',	'a:1:{s:32:\"0d865ae31619110d5a4c6083f86d4796\";a:0:{}}',	'no'),
(447,	'theme_mods_twentythirteen',	'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:16;}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1540482573;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}}}}',	'yes'),
(517,	'_site_transient_timeout_community-events-1aecf33ab8525ff212ebdffbb438372e',	'1541049565',	'no'),
(518,	'_site_transient_community-events-1aecf33ab8525ff212ebdffbb438372e',	'a:2:{s:8:\"location\";a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}s:6:\"events\";a:5:{i:0;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:16:\"WordPress Meetup\";s:3:\"url\";s:60:\"https://www.meetup.com/WordPress-Melbourne/events/245299519/\";s:6:\"meetup\";s:30:\"WordPress Melbourne User Group\";s:10:\"meetup_url\";s:43:\"https://www.meetup.com/WordPress-Melbourne/\";s:4:\"date\";s:19:\"2018-11-14 18:30:00\";s:8:\"location\";a:4:{s:8:\"location\";s:19:\"Richmond, Australia\";s:7:\"country\";s:2:\"au\";s:8:\"latitude\";d:-37.829200999999998;s:9:\"longitude\";d:144.990082;}}i:1;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:33:\"WordPress Geelong November Meetup\";s:3:\"url\";s:58:\"https://www.meetup.com/WordPress-Geelong/events/253804745/\";s:6:\"meetup\";s:17:\"WordPress Geelong\";s:10:\"meetup_url\";s:41:\"https://www.meetup.com/WordPress-Geelong/\";s:4:\"date\";s:19:\"2018-11-15 18:30:00\";s:8:\"location\";a:4:{s:8:\"location\";s:18:\"Geelong, Australia\";s:7:\"country\";s:2:\"au\";s:8:\"latitude\";d:-38.147101999999997;s:9:\"longitude\";d:144.35657;}}i:2;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:16:\"WordPress Meetup\";s:3:\"url\";s:60:\"https://www.meetup.com/WordPress-Melbourne/events/255993182/\";s:6:\"meetup\";s:30:\"WordPress Melbourne User Group\";s:10:\"meetup_url\";s:43:\"https://www.meetup.com/WordPress-Melbourne/\";s:4:\"date\";s:19:\"2018-12-12 18:30:00\";s:8:\"location\";a:4:{s:8:\"location\";s:19:\"Richmond, Australia\";s:7:\"country\";s:2:\"au\";s:8:\"latitude\";d:-37.829200999999998;s:9:\"longitude\";d:144.990082;}}i:3;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:16:\"WordPress Meetup\";s:3:\"url\";s:60:\"https://www.meetup.com/WordPress-Melbourne/events/255475008/\";s:6:\"meetup\";s:30:\"WordPress Melbourne User Group\";s:10:\"meetup_url\";s:43:\"https://www.meetup.com/WordPress-Melbourne/\";s:4:\"date\";s:19:\"2019-01-09 18:30:00\";s:8:\"location\";a:4:{s:8:\"location\";s:19:\"Richmond, Australia\";s:7:\"country\";s:2:\"au\";s:8:\"latitude\";d:-37.829200999999998;s:9:\"longitude\";d:144.990082;}}i:4;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:16:\"WordPress Meetup\";s:3:\"url\";s:63:\"https://www.meetup.com/WordPress-Melbourne/events/kkkwlpyzdbrb/\";s:6:\"meetup\";s:30:\"WordPress Melbourne User Group\";s:10:\"meetup_url\";s:43:\"https://www.meetup.com/WordPress-Melbourne/\";s:4:\"date\";s:19:\"2019-02-13 18:30:00\";s:8:\"location\";a:4:{s:8:\"location\";s:19:\"Richmond, Australia\";s:7:\"country\";s:2:\"au\";s:8:\"latitude\";d:-37.829200999999998;s:9:\"longitude\";d:144.990082;}}}}',	'no'),
(492,	'_transient_timeout_plugin_slugs',	'1541028217',	'no'),
(493,	'_transient_plugin_slugs',	'a:11:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:1;s:19:\"akismet/akismet.php\";i:2;s:65:\"blossomthemes-email-newsletter/blossomthemes-email-newsletter.php\";i:3;s:61:\"blossomthemes-instagram-feed/blossomthemes-instagram-feed.php\";i:4;s:47:\"blossomthemes-toolkit/blossomthemes-toolkit.php\";i:5;s:43:\"custom-post-type-ui/custom-post-type-ui.php\";i:6;s:9:\"hello.php\";i:7;s:38:\"post-duplicator/m4c-postduplicator.php\";i:8;s:27:\"woocommerce/woocommerce.php\";i:9;s:33:\"wp-github-sync/wp-github-sync.php\";i:10;s:41:\"wordpress-importer/wordpress-importer.php\";}',	'no'),
(494,	'recently_activated',	'a:0:{}',	'yes'),
(372,	'_transient_timeout_wc_term_counts',	'1542906865',	'no'),
(373,	'_transient_wc_term_counts',	'a:1:{i:15;s:0:\"\";}',	'no'),
(522,	'_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9',	'1541049570',	'no'),
(523,	'_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9',	'1541049570',	'no'),
(524,	'_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9',	'1541006370',	'no'),
(525,	'_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b',	'1541049570',	'no'),
(526,	'_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b',	'<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2018/10/wordpress-5-0-beta-2/\'>WordPress 5.0 Beta 2</a></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://ma.tt/2018/10/whats-in-my-bag-2018-edition/\'>Matt: What’s in My Bag, 2018 Edition</a></li><li><a class=\'rsswidget\' href=\'https://wptavern.com/wordpress-com-and-jetpack-launch-new-activity-feature-for-monitoring-website-changes\'>WPTavern: WordPress.com and Jetpack Launch New Activity Feature for Monitoring Website Changes</a></li><li><a class=\'rsswidget\' href=\'https://wptavern.com/wordpress-accessibility-team-delivers-sobering-assessment-of-gutenberg-we-have-to-draw-a-line\'>WPTavern: WordPress Accessibility Team Delivers Sobering Assessment of Gutenberg: “We have to draw a line.”</a></li></ul></div>',	'no'),
(436,	'category_children',	'a:0:{}',	'yes'),
(132,	'can_compress_scripts',	'1',	'no'),
(157,	'current_theme',	'Watermelon',	'yes'),
(445,	'_site_transient_update_themes',	'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1541027808;s:7:\"checked\";a:3:{s:15:\"blossom-fashion\";s:5:\"1.1.4\";s:12:\"fashion-icon\";s:5:\"1.0.0\";s:10:\"watermelon\";s:3:\"1.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}',	'no'),
(440,	'theme_mods_blossom-fashion',	'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:16;}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1540481729;s:4:\"data\";a:7:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"sidebar\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:10:\"footer-one\";a:0:{}s:10:\"footer-two\";a:0:{}s:12:\"footer-three\";a:0:{}s:11:\"footer-four\";a:0:{}s:12:\"shop-sidebar\";a:0:{}}}}',	'yes'),
(158,	'theme_mods_fashion-icon',	'a:7:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:16;}s:18:\"custom_css_post_id\";i:-1;s:11:\"custom_logo\";i:22;s:12:\"social_links\";a:0:{}s:15:\"ed_social_links\";b:0;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1541008369;s:4:\"data\";a:7:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"sidebar\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:10:\"footer-one\";a:0:{}s:10:\"footer-two\";a:0:{}s:12:\"footer-three\";a:0:{}s:11:\"footer-four\";a:0:{}s:12:\"shop-sidebar\";a:0:{}}}}',	'yes'),
(159,	'theme_switched',	'',	'yes'),
(396,	'woocommerce_maybe_regenerate_images_hash',	'991b1ca641921cf0f5baf7a2fe85861b',	'yes'),
(407,	'_transient_timeout_wc_shipping_method_count_1_1540388281',	'1542980520',	'no'),
(401,	'nav_menu_options',	'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}',	'yes'),
(402,	'_transient_shipping-transient-version',	'1540388281',	'yes'),
(408,	'_transient_wc_shipping_method_count_1_1540388281',	'0',	'no'),
(417,	'_site_transient_timeout_browser_90ff8ae6231a43c42b418e1765751722',	'1541086069',	'no'),
(168,	'widget_blossomthemes_email_newsletter_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(169,	'widget_btif_instagram_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(283,	'woocommerce_admin_notices',	'a:3:{i:0;s:7:\"install\";i:1;s:20:\"no_secure_connection\";i:2;s:14:\"template_files\";}',	'yes'),
(172,	'woocommerce_store_address',	'',	'yes'),
(173,	'woocommerce_store_address_2',	'',	'yes'),
(174,	'woocommerce_store_city',	'',	'yes'),
(175,	'woocommerce_default_country',	'GB',	'yes'),
(176,	'woocommerce_store_postcode',	'',	'yes'),
(177,	'woocommerce_allowed_countries',	'all',	'yes'),
(178,	'woocommerce_all_except_countries',	'',	'yes'),
(179,	'woocommerce_specific_allowed_countries',	'',	'yes'),
(180,	'woocommerce_ship_to_countries',	'',	'yes'),
(181,	'woocommerce_specific_ship_to_countries',	'',	'yes'),
(182,	'woocommerce_default_customer_address',	'geolocation',	'yes'),
(183,	'woocommerce_calc_taxes',	'no',	'yes'),
(184,	'woocommerce_enable_coupons',	'yes',	'yes'),
(185,	'woocommerce_calc_discounts_sequentially',	'no',	'no'),
(186,	'woocommerce_currency',	'GBP',	'yes'),
(187,	'woocommerce_currency_pos',	'left',	'yes'),
(188,	'woocommerce_price_thousand_sep',	',',	'yes'),
(189,	'woocommerce_price_decimal_sep',	'.',	'yes'),
(190,	'woocommerce_price_num_decimals',	'2',	'yes'),
(191,	'woocommerce_shop_page_id',	'',	'yes'),
(192,	'woocommerce_cart_redirect_after_add',	'no',	'yes'),
(193,	'woocommerce_enable_ajax_add_to_cart',	'yes',	'yes'),
(194,	'woocommerce_weight_unit',	'kg',	'yes'),
(195,	'woocommerce_dimension_unit',	'cm',	'yes'),
(196,	'woocommerce_enable_reviews',	'yes',	'yes'),
(197,	'woocommerce_review_rating_verification_label',	'yes',	'no'),
(198,	'woocommerce_review_rating_verification_required',	'no',	'no'),
(199,	'woocommerce_enable_review_rating',	'yes',	'yes'),
(200,	'woocommerce_review_rating_required',	'yes',	'no'),
(201,	'woocommerce_manage_stock',	'yes',	'yes'),
(202,	'woocommerce_hold_stock_minutes',	'60',	'no'),
(203,	'woocommerce_notify_low_stock',	'yes',	'no'),
(204,	'woocommerce_notify_no_stock',	'yes',	'no'),
(205,	'woocommerce_stock_email_recipient',	'salee15@student.monash.edu',	'no'),
(206,	'woocommerce_notify_low_stock_amount',	'2',	'no'),
(207,	'woocommerce_notify_no_stock_amount',	'0',	'yes'),
(208,	'woocommerce_hide_out_of_stock_items',	'no',	'yes'),
(209,	'woocommerce_stock_format',	'',	'yes'),
(210,	'woocommerce_file_download_method',	'force',	'no'),
(211,	'woocommerce_downloads_require_login',	'no',	'no'),
(212,	'woocommerce_downloads_grant_access_after_payment',	'yes',	'no'),
(213,	'woocommerce_prices_include_tax',	'no',	'yes'),
(214,	'woocommerce_tax_based_on',	'shipping',	'yes'),
(215,	'woocommerce_shipping_tax_class',	'inherit',	'yes'),
(216,	'woocommerce_tax_round_at_subtotal',	'no',	'yes'),
(217,	'woocommerce_tax_classes',	'Reduced rate\r\nZero rate',	'yes'),
(218,	'woocommerce_tax_display_shop',	'excl',	'yes'),
(219,	'woocommerce_tax_display_cart',	'excl',	'yes'),
(220,	'woocommerce_price_display_suffix',	'',	'yes'),
(221,	'woocommerce_tax_total_display',	'itemized',	'no'),
(222,	'woocommerce_enable_shipping_calc',	'yes',	'no'),
(223,	'woocommerce_shipping_cost_requires_address',	'no',	'yes'),
(224,	'woocommerce_ship_to_destination',	'billing',	'no'),
(225,	'woocommerce_shipping_debug_mode',	'no',	'yes'),
(226,	'woocommerce_enable_guest_checkout',	'yes',	'no'),
(227,	'woocommerce_enable_checkout_login_reminder',	'no',	'no'),
(228,	'woocommerce_enable_signup_and_login_from_checkout',	'no',	'no'),
(229,	'woocommerce_enable_myaccount_registration',	'no',	'no'),
(230,	'woocommerce_registration_generate_username',	'yes',	'no'),
(231,	'woocommerce_registration_generate_password',	'yes',	'no'),
(232,	'woocommerce_erasure_request_removes_order_data',	'no',	'no'),
(233,	'woocommerce_erasure_request_removes_download_data',	'no',	'no'),
(234,	'woocommerce_registration_privacy_policy_text',	'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].',	'yes'),
(235,	'woocommerce_checkout_privacy_policy_text',	'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].',	'yes'),
(236,	'woocommerce_delete_inactive_accounts',	'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}',	'no'),
(237,	'woocommerce_trash_pending_orders',	'',	'no'),
(238,	'woocommerce_trash_failed_orders',	'',	'no'),
(239,	'woocommerce_trash_cancelled_orders',	'',	'no'),
(240,	'woocommerce_anonymize_completed_orders',	'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}',	'no'),
(241,	'woocommerce_email_from_name',	'watermelon',	'no'),
(242,	'woocommerce_email_from_address',	'salee15@student.monash.edu',	'no'),
(243,	'woocommerce_email_header_image',	'',	'no'),
(244,	'woocommerce_email_footer_text',	'{site_title}',	'no'),
(245,	'woocommerce_email_base_color',	'#96588a',	'no'),
(246,	'woocommerce_email_background_color',	'#f7f7f7',	'no'),
(247,	'woocommerce_email_body_background_color',	'#ffffff',	'no'),
(248,	'woocommerce_email_text_color',	'#3c3c3c',	'no'),
(249,	'woocommerce_cart_page_id',	'',	'yes'),
(250,	'woocommerce_checkout_page_id',	'',	'yes'),
(251,	'woocommerce_myaccount_page_id',	'',	'yes'),
(252,	'woocommerce_terms_page_id',	'',	'no'),
(253,	'woocommerce_force_ssl_checkout',	'no',	'yes'),
(254,	'woocommerce_unforce_ssl_checkout',	'no',	'yes'),
(255,	'woocommerce_checkout_pay_endpoint',	'order-pay',	'yes'),
(256,	'woocommerce_checkout_order_received_endpoint',	'order-received',	'yes'),
(257,	'woocommerce_myaccount_add_payment_method_endpoint',	'add-payment-method',	'yes'),
(258,	'woocommerce_myaccount_delete_payment_method_endpoint',	'delete-payment-method',	'yes'),
(259,	'woocommerce_myaccount_set_default_payment_method_endpoint',	'set-default-payment-method',	'yes'),
(260,	'woocommerce_myaccount_orders_endpoint',	'orders',	'yes'),
(261,	'woocommerce_myaccount_view_order_endpoint',	'view-order',	'yes'),
(262,	'woocommerce_myaccount_downloads_endpoint',	'downloads',	'yes'),
(263,	'woocommerce_myaccount_edit_account_endpoint',	'edit-account',	'yes'),
(264,	'woocommerce_myaccount_edit_address_endpoint',	'edit-address',	'yes'),
(265,	'woocommerce_myaccount_payment_methods_endpoint',	'payment-methods',	'yes'),
(266,	'woocommerce_myaccount_lost_password_endpoint',	'lost-password',	'yes'),
(267,	'woocommerce_logout_endpoint',	'customer-logout',	'yes'),
(268,	'woocommerce_api_enabled',	'no',	'yes'),
(269,	'woocommerce_single_image_width',	'600',	'yes'),
(270,	'woocommerce_thumbnail_image_width',	'300',	'yes'),
(271,	'woocommerce_checkout_highlight_required_fields',	'yes',	'yes'),
(272,	'woocommerce_demo_store',	'no',	'no'),
(273,	'woocommerce_permalinks',	'a:5:{s:12:\"product_base\";s:7:\"product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}',	'yes'),
(274,	'current_theme_supports_woocommerce',	'no',	'yes'),
(275,	'woocommerce_queue_flush_rewrite_rules',	'no',	'yes'),
(276,	'_transient_wc_attribute_taxonomies',	'a:0:{}',	'yes'),
(277,	'product_cat_children',	'a:0:{}',	'yes'),
(278,	'default_product_cat',	'15',	'yes'),
(299,	'woocommerce_meta_box_errors',	'a:0:{}',	'yes'),
(312,	'_transient_timeout_wc_outofstock_count',	'1542772073',	'no'),
(281,	'woocommerce_version',	'3.4.7',	'yes'),
(282,	'woocommerce_db_version',	'3.4.7',	'yes'),
(284,	'_transient_woocommerce_webhook_ids',	'a:0:{}',	'yes'),
(285,	'widget_woocommerce_widget_cart',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(286,	'widget_woocommerce_layered_nav_filters',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(287,	'widget_woocommerce_layered_nav',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(288,	'widget_woocommerce_price_filter',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(289,	'widget_woocommerce_product_categories',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(290,	'widget_woocommerce_product_search',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(291,	'widget_woocommerce_product_tag_cloud',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(292,	'widget_woocommerce_products',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(293,	'widget_woocommerce_recently_viewed_products',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(294,	'widget_woocommerce_top_rated_products',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(295,	'widget_woocommerce_recent_reviews',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(296,	'widget_woocommerce_rating_filter',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(298,	'_transient_wc_count_comments',	'O:8:\"stdClass\":7:{s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:8:\"approved\";s:1:\"1\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}',	'yes'),
(313,	'_transient_wc_outofstock_count',	'0',	'no'),
(310,	'_transient_timeout_wc_low_stock_count',	'1542772072',	'no'),
(311,	'_transient_wc_low_stock_count',	'0',	'no'),
(466,	'_transient_timeout_external_ip_address_127.0.0.1',	'1541545833',	'no'),
(467,	'_transient_external_ip_address_127.0.0.1',	'49.127.191.246',	'no'),
(314,	'widget_bttk_author_bio',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(315,	'widget_bttk_popular_post',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(316,	'widget_bttk_pro_recent_post',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(317,	'widget_bttk_custom_categories',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(318,	'widget_bttk_image_text_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(319,	'widget_bttk_posts_category_slider_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(320,	'widget_bttk_twitter_feeds_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(321,	'widget_bttk_facebook_page_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(322,	'widget_bttk_advertisement_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(323,	'widget_bttk_pinterest_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(324,	'widget_bttk_snapcode_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(325,	'widget_bttk_social_links',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(326,	'widget_blossom_client_logo_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(327,	'widget_blossomtheme_featured_page_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(328,	'widget_blossomtheme_companion_cta_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(329,	'widget_bttk_testimonial_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(330,	'widget_blossomthemes_stat_counter_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(331,	'widget_bttk_description_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(332,	'widget_bttk_icon_text_widget',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(333,	'widget_bttk_contact_social_links',	'a:1:{s:12:\"_multiwidget\";i:1;}',	'yes'),
(418,	'_site_transient_browser_90ff8ae6231a43c42b418e1765751722',	'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"70.0.3538.77\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}',	'no'),
(549,	'_transient__woocommerce_helper_subscriptions',	'a:0:{}',	'no'),
(576,	'_site_transient_update_plugins',	'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1541027809;s:7:\"checked\";a:11:{s:30:\"advanced-custom-fields/acf.php\";s:5:\"5.7.7\";s:19:\"akismet/akismet.php\";s:5:\"4.0.8\";s:65:\"blossomthemes-email-newsletter/blossomthemes-email-newsletter.php\";s:5:\"1.2.4\";s:61:\"blossomthemes-instagram-feed/blossomthemes-instagram-feed.php\";s:5:\"1.1.1\";s:47:\"blossomthemes-toolkit/blossomthemes-toolkit.php\";s:5:\"2.0.6\";s:43:\"custom-post-type-ui/custom-post-type-ui.php\";s:5:\"1.5.8\";s:9:\"hello.php\";s:3:\"1.7\";s:38:\"post-duplicator/m4c-postduplicator.php\";s:4:\"2.20\";s:27:\"woocommerce/woocommerce.php\";s:5:\"3.4.7\";s:33:\"wp-github-sync/wp-github-sync.php\";s:5:\"2.0.1\";s:41:\"wordpress-importer/wordpress-importer.php\";s:5:\"0.6.4\";}s:8:\"response\";a:3:{s:47:\"blossomthemes-toolkit/blossomthemes-toolkit.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:35:\"w.org/plugins/blossomthemes-toolkit\";s:4:\"slug\";s:21:\"blossomthemes-toolkit\";s:6:\"plugin\";s:47:\"blossomthemes-toolkit/blossomthemes-toolkit.php\";s:11:\"new_version\";s:5:\"2.0.8\";s:3:\"url\";s:52:\"https://wordpress.org/plugins/blossomthemes-toolkit/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/blossomthemes-toolkit.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:74:\"https://ps.w.org/blossomthemes-toolkit/assets/icon-256x256.png?rev=1735221\";s:2:\"1x\";s:74:\"https://ps.w.org/blossomthemes-toolkit/assets/icon-128x128.png?rev=1735224\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:77:\"https://ps.w.org/blossomthemes-toolkit/assets/banner-1544x500.png?rev=1735225\";s:2:\"1x\";s:76:\"https://ps.w.org/blossomthemes-toolkit/assets/banner-772x250.png?rev=1735222\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.8\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:43:\"custom-post-type-ui/custom-post-type-ui.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:33:\"w.org/plugins/custom-post-type-ui\";s:4:\"slug\";s:19:\"custom-post-type-ui\";s:6:\"plugin\";s:43:\"custom-post-type-ui/custom-post-type-ui.php\";s:11:\"new_version\";s:5:\"1.6.0\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/custom-post-type-ui/\";s:7:\"package\";s:68:\"https://downloads.wordpress.org/plugin/custom-post-type-ui.1.6.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/custom-post-type-ui/assets/icon-256x256.png?rev=1069557\";s:2:\"1x\";s:72:\"https://ps.w.org/custom-post-type-ui/assets/icon-128x128.png?rev=1069557\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/custom-post-type-ui/assets/banner-1544x500.png?rev=1069557\";s:2:\"1x\";s:74:\"https://ps.w.org/custom-post-type-ui/assets/banner-772x250.png?rev=1069557\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.8\";s:12:\"requires_php\";s:3:\"5.2\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"3.5.1\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.3.5.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=1440831\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=1440831\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=1629184\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=1629184\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.8\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:8:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:5:\"5.7.7\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.5.7.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";}s:11:\"banners_rtl\";a:0:{}}s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.8\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:65:\"blossomthemes-email-newsletter/blossomthemes-email-newsletter.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:44:\"w.org/plugins/blossomthemes-email-newsletter\";s:4:\"slug\";s:30:\"blossomthemes-email-newsletter\";s:6:\"plugin\";s:65:\"blossomthemes-email-newsletter/blossomthemes-email-newsletter.php\";s:11:\"new_version\";s:5:\"1.2.4\";s:3:\"url\";s:61:\"https://wordpress.org/plugins/blossomthemes-email-newsletter/\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/plugin/blossomthemes-email-newsletter.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:83:\"https://ps.w.org/blossomthemes-email-newsletter/assets/icon-256x256.png?rev=1739994\";s:2:\"1x\";s:83:\"https://ps.w.org/blossomthemes-email-newsletter/assets/icon-128x128.png?rev=1739991\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:86:\"https://ps.w.org/blossomthemes-email-newsletter/assets/banner-1544x500.png?rev=1739992\";s:2:\"1x\";s:85:\"https://ps.w.org/blossomthemes-email-newsletter/assets/banner-772x250.png?rev=1739993\";}s:11:\"banners_rtl\";a:0:{}}s:61:\"blossomthemes-instagram-feed/blossomthemes-instagram-feed.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:42:\"w.org/plugins/blossomthemes-instagram-feed\";s:4:\"slug\";s:28:\"blossomthemes-instagram-feed\";s:6:\"plugin\";s:61:\"blossomthemes-instagram-feed/blossomthemes-instagram-feed.php\";s:11:\"new_version\";s:5:\"1.1.1\";s:3:\"url\";s:59:\"https://wordpress.org/plugins/blossomthemes-instagram-feed/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/blossomthemes-instagram-feed.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:81:\"https://ps.w.org/blossomthemes-instagram-feed/assets/icon-256x256.png?rev=1740025\";s:2:\"1x\";s:81:\"https://ps.w.org/blossomthemes-instagram-feed/assets/icon-128x128.png?rev=1740027\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:84:\"https://ps.w.org/blossomthemes-instagram-feed/assets/banner-1544x500.png?rev=1740023\";s:2:\"1x\";s:83:\"https://ps.w.org/blossomthemes-instagram-feed/assets/banner-772x250.png?rev=1740024\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}s:38:\"post-duplicator/m4c-postduplicator.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:29:\"w.org/plugins/post-duplicator\";s:4:\"slug\";s:15:\"post-duplicator\";s:6:\"plugin\";s:38:\"post-duplicator/m4c-postduplicator.php\";s:11:\"new_version\";s:4:\"2.20\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/post-duplicator/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/post-duplicator.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:68:\"https://ps.w.org/post-duplicator/assets/icon-128x128.png?rev=1587588\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/post-duplicator/assets/banner-1544x500.png?rev=1587588\";s:2:\"1x\";s:70:\"https://ps.w.org/post-duplicator/assets/banner-772x250.png?rev=1587588\";}s:11:\"banners_rtl\";a:0:{}}s:33:\"wp-github-sync/wp-github-sync.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/wp-github-sync\";s:4:\"slug\";s:14:\"wp-github-sync\";s:6:\"plugin\";s:33:\"wp-github-sync/wp-github-sync.php\";s:11:\"new_version\";s:5:\"2.0.1\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/wp-github-sync/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/wp-github-sync.2.0.1.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:58:\"https://s.w.org/plugins/geopattern-icon/wp-github-sync.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:41:\"wordpress-importer/wordpress-importer.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:32:\"w.org/plugins/wordpress-importer\";s:4:\"slug\";s:18:\"wordpress-importer\";s:6:\"plugin\";s:41:\"wordpress-importer/wordpress-importer.php\";s:11:\"new_version\";s:5:\"0.6.4\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/wordpress-importer/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/wordpress-importer.0.6.4.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:71:\"https://ps.w.org/wordpress-importer/assets/icon-256x256.png?rev=1908375\";s:2:\"1x\";s:63:\"https://ps.w.org/wordpress-importer/assets/icon.svg?rev=1908375\";s:3:\"svg\";s:63:\"https://ps.w.org/wordpress-importer/assets/icon.svg?rev=1908375\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-importer/assets/banner-772x250.png?rev=547654\";}s:11:\"banners_rtl\";a:0:{}}}}',	'no')
ON DUPLICATE KEY UPDATE `option_id` = VALUES(`option_id`), `option_name` = VALUES(`option_name`), `option_value` = VALUES(`option_value`), `autoload` = VALUES(`autoload`);

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1,	2,	'_wp_page_template',	'default'),
(2,	3,	'_wp_page_template',	'default'),
(3,	2,	'_wp_trash_meta_status',	'publish'),
(4,	2,	'_wp_trash_meta_time',	'1540034127'),
(5,	2,	'_wp_desired_post_slug',	'sample-page'),
(6,	3,	'_edit_lock',	'1540386292:1'),
(7,	3,	'_edit_last',	'1'),
(8,	1,	'_edit_lock',	'1540034039:1'),
(9,	1,	'_edit_last',	'1'),
(11,	8,	'_edit_last',	'1'),
(12,	8,	'_sidebar_layout',	'default-sidebar'),
(13,	8,	'_edit_lock',	'1540189180:1'),
(15,	10,	'_edit_last',	'1'),
(16,	10,	'_edit_lock',	'1540386463:1'),
(17,	10,	'_wp_page_template',	'default'),
(18,	10,	'_sidebar_layout',	'default-sidebar'),
(19,	12,	'_edit_last',	'1'),
(20,	12,	'_wp_page_template',	'default'),
(21,	12,	'_sidebar_layout',	'default-sidebar'),
(22,	12,	'_edit_lock',	'1540386344:1'),
(23,	14,	'_menu_item_type',	'custom'),
(24,	14,	'_menu_item_menu_item_parent',	'0'),
(25,	14,	'_menu_item_object_id',	'14'),
(26,	14,	'_menu_item_object',	'custom'),
(27,	14,	'_menu_item_target',	''),
(28,	14,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(29,	14,	'_menu_item_xfn',	''),
(30,	14,	'_menu_item_url',	'http://localhost:3157/watermelon/'),
(31,	14,	'_menu_item_orphaned',	'1540386582'),
(32,	15,	'_menu_item_type',	'post_type'),
(33,	15,	'_menu_item_menu_item_parent',	'0'),
(34,	15,	'_menu_item_object_id',	'3'),
(35,	15,	'_menu_item_object',	'page'),
(36,	15,	'_menu_item_target',	''),
(37,	15,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(38,	15,	'_menu_item_xfn',	''),
(39,	15,	'_menu_item_url',	''),
(40,	15,	'_menu_item_orphaned',	'1540386582'),
(41,	16,	'_menu_item_type',	'post_type'),
(42,	16,	'_menu_item_menu_item_parent',	'0'),
(43,	16,	'_menu_item_object_id',	'10'),
(44,	16,	'_menu_item_object',	'page'),
(45,	16,	'_menu_item_target',	''),
(46,	16,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(47,	16,	'_menu_item_xfn',	''),
(48,	16,	'_menu_item_url',	''),
(49,	16,	'_menu_item_orphaned',	'1540386583'),
(50,	17,	'_menu_item_type',	'post_type'),
(51,	17,	'_menu_item_menu_item_parent',	'0'),
(52,	17,	'_menu_item_object_id',	'12'),
(53,	17,	'_menu_item_object',	'page'),
(54,	17,	'_menu_item_target',	''),
(55,	17,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(56,	17,	'_menu_item_xfn',	''),
(57,	17,	'_menu_item_url',	''),
(58,	17,	'_menu_item_orphaned',	'1540386583'),
(59,	18,	'_menu_item_type',	'custom'),
(60,	18,	'_menu_item_menu_item_parent',	'0'),
(61,	18,	'_menu_item_object_id',	'18'),
(62,	18,	'_menu_item_object',	'custom'),
(63,	18,	'_menu_item_target',	''),
(64,	18,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(65,	18,	'_menu_item_xfn',	''),
(66,	18,	'_menu_item_url',	'http://localhost:3157/watermelon/'),
(67,	18,	'_menu_item_orphaned',	'1540386697'),
(68,	19,	'_menu_item_type',	'post_type'),
(69,	19,	'_menu_item_menu_item_parent',	'0'),
(70,	19,	'_menu_item_object_id',	'3'),
(71,	19,	'_menu_item_object',	'page'),
(72,	19,	'_menu_item_target',	''),
(73,	19,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(74,	19,	'_menu_item_xfn',	''),
(75,	19,	'_menu_item_url',	''),
(76,	19,	'_menu_item_orphaned',	'1540386697'),
(77,	20,	'_menu_item_type',	'post_type'),
(78,	20,	'_menu_item_menu_item_parent',	'0'),
(79,	20,	'_menu_item_object_id',	'10'),
(80,	20,	'_menu_item_object',	'page'),
(81,	20,	'_menu_item_target',	''),
(82,	20,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(83,	20,	'_menu_item_xfn',	''),
(84,	20,	'_menu_item_url',	''),
(85,	20,	'_menu_item_orphaned',	'1540386697'),
(86,	21,	'_menu_item_type',	'post_type'),
(87,	21,	'_menu_item_menu_item_parent',	'0'),
(88,	21,	'_menu_item_object_id',	'12'),
(89,	21,	'_menu_item_object',	'page'),
(90,	21,	'_menu_item_target',	''),
(91,	21,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(92,	21,	'_menu_item_xfn',	''),
(93,	21,	'_menu_item_url',	''),
(94,	21,	'_menu_item_orphaned',	'1540386697'),
(95,	22,	'_wp_attached_file',	'2018/10/hraff-logo-e1540387556709.png'),
(96,	22,	'_wp_attachment_metadata',	'a:5:{s:5:\"width\";i:125;s:6:\"height\";i:108;s:4:\"file\";s:37:\"2018/10/hraff-logo-e1540387556709.png\";s:5:\"sizes\";a:6:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:37:\"hraff-logo-e1540387556709-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"hraff-logo-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:22:\"post-slider-thumb-size\";a:4:{s:4:\"file\";s:22:\"hraff-logo-250x190.png\";s:5:\"width\";i:250;s:6:\"height\";i:190;s:9:\"mime-type\";s:9:\"image/png\";}s:28:\"blossom-fashion-blog-archive\";a:4:{s:4:\"file\";s:22:\"hraff-logo-250x200.png\";s:5:\"width\";i:250;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:23:\"blossom-fashion-popular\";a:4:{s:4:\"file\";s:22:\"hraff-logo-250x215.png\";s:5:\"width\";i:250;s:6:\"height\";i:215;s:9:\"mime-type\";s:9:\"image/png\";}s:22:\"blossom-fashion-schema\";a:4:{s:4:\"file\";s:20:\"hraff-logo-69x60.png\";s:5:\"width\";i:69;s:6:\"height\";i:60;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(97,	22,	'_edit_lock',	'1540387588:1'),
(98,	22,	'_edit_last',	'1'),
(100,	22,	'_wp_attachment_backup_sizes',	'a:2:{s:9:\"full-orig\";a:3:{s:5:\"width\";i:250;s:6:\"height\";i:216;s:4:\"file\";s:14:\"hraff-logo.png\";}s:18:\"full-1540387556709\";a:3:{s:5:\"width\";i:200;s:6:\"height\";i:173;s:4:\"file\";s:29:\"hraff-logo-e1540387477116.png\";}}'),
(185,	8,	'_bttk_view_count',	'7'),
(104,	25,	'_wp_trash_meta_status',	'publish'),
(105,	25,	'_wp_trash_meta_time',	'1540387649'),
(106,	26,	'_menu_item_type',	'custom'),
(107,	26,	'_menu_item_menu_item_parent',	'0'),
(108,	26,	'_menu_item_object_id',	'26'),
(109,	26,	'_menu_item_object',	'custom'),
(110,	26,	'_menu_item_target',	''),
(111,	26,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(112,	26,	'_menu_item_xfn',	''),
(113,	26,	'_menu_item_url',	'http://localhost:3157/watermelon/'),
(115,	27,	'_menu_item_type',	'post_type'),
(116,	27,	'_menu_item_menu_item_parent',	'0'),
(117,	27,	'_menu_item_object_id',	'3'),
(118,	27,	'_menu_item_object',	'page'),
(119,	27,	'_menu_item_target',	''),
(120,	27,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(121,	27,	'_menu_item_xfn',	''),
(122,	27,	'_menu_item_url',	''),
(143,	30,	'_customize_changeset_uuid',	'a182604a-e34d-4de6-8dab-c8e96655fcd5'),
(124,	28,	'_menu_item_type',	'post_type'),
(125,	28,	'_menu_item_menu_item_parent',	'0'),
(126,	28,	'_menu_item_object_id',	'10'),
(127,	28,	'_menu_item_object',	'page'),
(128,	28,	'_menu_item_target',	''),
(129,	28,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(130,	28,	'_menu_item_xfn',	''),
(131,	28,	'_menu_item_url',	''),
(151,	37,	'_menu_item_object_id',	'30'),
(133,	29,	'_menu_item_type',	'post_type'),
(134,	29,	'_menu_item_menu_item_parent',	'0'),
(135,	29,	'_menu_item_object_id',	'12'),
(136,	29,	'_menu_item_object',	'page'),
(137,	29,	'_menu_item_target',	''),
(138,	29,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(139,	29,	'_menu_item_xfn',	''),
(140,	29,	'_menu_item_url',	''),
(152,	37,	'_menu_item_object',	'page'),
(150,	37,	'_menu_item_menu_item_parent',	'0'),
(145,	31,	'_customize_changeset_uuid',	'a182604a-e34d-4de6-8dab-c8e96655fcd5'),
(149,	37,	'_menu_item_type',	'post_type'),
(147,	32,	'_customize_changeset_uuid',	'a182604a-e34d-4de6-8dab-c8e96655fcd5'),
(148,	33,	'_edit_lock',	'1540388545:1'),
(153,	37,	'_menu_item_target',	''),
(154,	37,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(155,	37,	'_menu_item_xfn',	''),
(156,	37,	'_menu_item_url',	''),
(157,	38,	'_menu_item_type',	'post_type'),
(158,	38,	'_menu_item_menu_item_parent',	'0'),
(159,	38,	'_menu_item_object_id',	'31'),
(160,	38,	'_menu_item_object',	'page'),
(161,	38,	'_menu_item_target',	''),
(162,	38,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(163,	38,	'_menu_item_xfn',	''),
(164,	38,	'_menu_item_url',	''),
(165,	39,	'_menu_item_type',	'post_type'),
(166,	39,	'_menu_item_menu_item_parent',	'0'),
(167,	39,	'_menu_item_object_id',	'32'),
(168,	39,	'_menu_item_object',	'page'),
(169,	39,	'_menu_item_target',	''),
(170,	39,	'_menu_item_classes',	'a:1:{i:0;s:0:\"\";}'),
(171,	39,	'_menu_item_xfn',	''),
(172,	39,	'_menu_item_url',	''),
(173,	33,	'_wp_trash_meta_status',	'publish'),
(174,	33,	'_wp_trash_meta_time',	'1540388434'),
(175,	40,	'_edit_lock',	'1540388588:1'),
(176,	40,	'_wp_trash_meta_status',	'publish'),
(177,	40,	'_wp_trash_meta_time',	'1540388593'),
(178,	41,	'_wp_trash_meta_status',	'publish'),
(179,	41,	'_wp_trash_meta_time',	'1540388647'),
(180,	42,	'_edit_last',	'1'),
(181,	42,	'_sidebar_layout',	'default-sidebar'),
(182,	42,	'_edit_lock',	'1540481429:1'),
(184,	42,	'_bttk_view_count',	'3')
ON DUPLICATE KEY UPDATE `meta_id` = VALUES(`meta_id`), `post_id` = VALUES(`post_id`), `meta_key` = VALUES(`meta_key`), `meta_value` = VALUES(`meta_value`);

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1,	1,	'2018-10-20 11:07:57',	'2018-10-20 11:07:57',	'Welcome to WordPress. This is your first post. Edit or delete it, then start writing! TEST',	'Hello world!',	'',	'publish',	'open',	'open',	'',	'hello-world',	'',	'',	'2018-10-20 11:16:17',	'2018-10-20 11:16:17',	'',	0,	'http://localhost:3157/watermelon/?p=1',	0,	'post',	'',	1),
(2,	1,	'2018-10-20 11:07:57',	'2018-10-20 11:07:57',	'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost:3157/watermelon/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!',	'Sample Page',	'',	'trash',	'closed',	'open',	'',	'sample-page__trashed',	'',	'',	'2018-10-20 11:15:27',	'2018-10-20 11:15:27',	'',	0,	'http://localhost:3157/watermelon/?page_id=2',	0,	'page',	'',	0),
(3,	1,	'2018-10-20 11:07:57',	'2018-10-20 11:07:57',	'<h2>Who we are</h2>\r\nOur website address is: http://localhost:3157/watermelon. TEST\r\n<h2>What personal data we collect and why we collect it</h2>\r\n<h3>Comments</h3>\r\nWhen visitors leave comments on the site we collect the data shown in the comments form, and also the visitor’s IP address and browser user agent string to help spam detection.\r\n\r\nAn anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.\r\n<h3>Media</h3>\r\nIf you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.\r\n<h3>Contact forms</h3>\r\n<h3>Cookies</h3>\r\nIf you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.\r\n\r\nIf you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.\r\n\r\nWhen you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select \"Remember Me\", your login will persist for two weeks. If you log out of your account, the login cookies will be removed.\r\n\r\nIf you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.\r\n<h3>Embedded content from other websites</h3>\r\nArticles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.\r\n\r\nThese websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.\r\n<h3>Analytics</h3>\r\n<h2>Who we share your data with</h2>\r\n<h2>How long we retain your data</h2>\r\nIf you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.\r\n\r\nFor users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.\r\n<h2>What rights you have over your data</h2>\r\nIf you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.\r\n<h2>Where we send your data</h2>\r\nVisitor comments may be checked through an automated spam detection service.\r\n<h2>Your contact information</h2>\r\n<h2>Additional information</h2>\r\n<h3>How we protect your data</h3>\r\n<h3>What data breach procedures we have in place</h3>\r\n<h3>What third parties we receive data from</h3>\r\n<h3>What automated decision making and/or profiling we do with user data</h3>\r\n<h3>Industry regulatory disclosure requirements</h3>',	'Privacy Policy',	'',	'publish',	'closed',	'open',	'',	'privacy-policy',	'',	'',	'2018-10-20 11:15:39',	'2018-10-20 11:15:39',	'',	0,	'http://localhost:3157/watermelon/?page_id=3',	0,	'page',	'',	0),
(44,	1,	'2018-10-30 23:22:22',	'0000-00-00 00:00:00',	'',	'Auto Draft',	'',	'auto-draft',	'open',	'open',	'',	'',	'',	'',	'2018-10-30 23:22:22',	'0000-00-00 00:00:00',	'',	0,	'http://localhost:3157/watermelon/?p=44',	0,	'post',	'',	0),
(5,	1,	'2018-10-20 11:15:27',	'2018-10-20 11:15:27',	'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost:3157/watermelon/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!',	'Sample Page',	'',	'inherit',	'closed',	'closed',	'',	'2-revision-v1',	'',	'',	'2018-10-20 11:15:27',	'2018-10-20 11:15:27',	'',	2,	'http://localhost:3157/watermelon/?p=5',	0,	'revision',	'',	0),
(6,	1,	'2018-10-20 11:15:39',	'2018-10-20 11:15:39',	'<h2>Who we are</h2>\r\nOur website address is: http://localhost:3157/watermelon. TEST\r\n<h2>What personal data we collect and why we collect it</h2>\r\n<h3>Comments</h3>\r\nWhen visitors leave comments on the site we collect the data shown in the comments form, and also the visitor’s IP address and browser user agent string to help spam detection.\r\n\r\nAn anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.\r\n<h3>Media</h3>\r\nIf you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.\r\n<h3>Contact forms</h3>\r\n<h3>Cookies</h3>\r\nIf you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.\r\n\r\nIf you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.\r\n\r\nWhen you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select \"Remember Me\", your login will persist for two weeks. If you log out of your account, the login cookies will be removed.\r\n\r\nIf you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.\r\n<h3>Embedded content from other websites</h3>\r\nArticles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.\r\n\r\nThese websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.\r\n<h3>Analytics</h3>\r\n<h2>Who we share your data with</h2>\r\n<h2>How long we retain your data</h2>\r\nIf you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.\r\n\r\nFor users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.\r\n<h2>What rights you have over your data</h2>\r\nIf you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.\r\n<h2>Where we send your data</h2>\r\nVisitor comments may be checked through an automated spam detection service.\r\n<h2>Your contact information</h2>\r\n<h2>Additional information</h2>\r\n<h3>How we protect your data</h3>\r\n<h3>What data breach procedures we have in place</h3>\r\n<h3>What third parties we receive data from</h3>\r\n<h3>What automated decision making and/or profiling we do with user data</h3>\r\n<h3>Industry regulatory disclosure requirements</h3>',	'Privacy Policy',	'',	'inherit',	'closed',	'closed',	'',	'3-revision-v1',	'',	'',	'2018-10-20 11:15:39',	'2018-10-20 11:15:39',	'',	3,	'http://localhost:3157/watermelon/?p=6',	0,	'revision',	'',	0),
(7,	1,	'2018-10-20 11:16:17',	'2018-10-20 11:16:17',	'Welcome to WordPress. This is your first post. Edit or delete it, then start writing! TEST',	'Hello world!',	'',	'inherit',	'closed',	'closed',	'',	'1-revision-v1',	'',	'',	'2018-10-20 11:16:17',	'2018-10-20 11:16:17',	'',	1,	'http://localhost:3157/watermelon/?p=7',	0,	'revision',	'',	0),
(8,	1,	'2018-10-22 06:21:49',	'2018-10-22 06:21:49',	'',	'Test Post',	'',	'publish',	'open',	'open',	'',	'test-post',	'',	'',	'2018-10-22 06:21:49',	'2018-10-22 06:21:49',	'',	0,	'http://localhost:3157/watermelon/?p=8',	0,	'post',	'',	0),
(9,	1,	'2018-10-22 06:21:39',	'2018-10-22 06:21:39',	'',	'Test Post',	'',	'inherit',	'closed',	'closed',	'',	'8-revision-v1',	'',	'',	'2018-10-22 06:21:39',	'2018-10-22 06:21:39',	'',	8,	'http://localhost:3157/watermelon/?p=9',	0,	'revision',	'',	0),
(10,	1,	'2018-10-22 06:22:19',	'2018-10-22 06:22:19',	'ttt',	'Test Page',	'',	'publish',	'closed',	'closed',	'',	'test-page',	'',	'',	'2018-10-22 06:22:19',	'2018-10-22 06:22:19',	'',	0,	'http://localhost:3157/watermelon/?page_id=10',	0,	'page',	'',	0),
(11,	1,	'2018-10-22 06:22:19',	'2018-10-22 06:22:19',	'ttt',	'Test Page',	'',	'inherit',	'closed',	'closed',	'',	'10-revision-v1',	'',	'',	'2018-10-22 06:22:19',	'2018-10-22 06:22:19',	'',	10,	'http://localhost:3157/watermelon/?p=11',	0,	'revision',	'',	0),
(12,	1,	'2018-10-24 13:07:22',	'2018-10-24 13:07:22',	'',	'testsss222',	'',	'publish',	'closed',	'closed',	'',	'testsss222',	'',	'',	'2018-10-24 13:07:22',	'2018-10-24 13:07:22',	'',	0,	'http://localhost:3157/watermelon/?page_id=12',	0,	'page',	'',	0),
(13,	1,	'2018-10-24 13:07:22',	'2018-10-24 13:07:22',	'',	'testsss222',	'',	'inherit',	'closed',	'closed',	'',	'12-revision-v1',	'',	'',	'2018-10-24 13:07:22',	'2018-10-24 13:07:22',	'',	12,	'http://localhost:3157/watermelon/?p=13',	0,	'revision',	'',	0),
(14,	1,	'2018-10-24 13:09:42',	'0000-00-00 00:00:00',	'',	'Home',	'',	'draft',	'closed',	'closed',	'',	'',	'',	'',	'2018-10-24 13:09:42',	'0000-00-00 00:00:00',	'',	0,	'http://localhost:3157/watermelon/?p=14',	1,	'nav_menu_item',	'',	0),
(15,	1,	'2018-10-24 13:09:42',	'0000-00-00 00:00:00',	' ',	'',	'',	'draft',	'closed',	'closed',	'',	'',	'',	'',	'2018-10-24 13:09:42',	'0000-00-00 00:00:00',	'',	0,	'http://localhost:3157/watermelon/?p=15',	1,	'nav_menu_item',	'',	0),
(16,	1,	'2018-10-24 13:09:42',	'0000-00-00 00:00:00',	' ',	'',	'',	'draft',	'closed',	'closed',	'',	'',	'',	'',	'2018-10-24 13:09:42',	'0000-00-00 00:00:00',	'',	0,	'http://localhost:3157/watermelon/?p=16',	1,	'nav_menu_item',	'',	0),
(17,	1,	'2018-10-24 13:09:43',	'0000-00-00 00:00:00',	' ',	'',	'',	'draft',	'closed',	'closed',	'',	'',	'',	'',	'2018-10-24 13:09:43',	'0000-00-00 00:00:00',	'',	0,	'http://localhost:3157/watermelon/?p=17',	1,	'nav_menu_item',	'',	0),
(18,	1,	'2018-10-24 13:11:37',	'0000-00-00 00:00:00',	'',	'Home',	'',	'draft',	'closed',	'closed',	'',	'',	'',	'',	'2018-10-24 13:11:37',	'0000-00-00 00:00:00',	'',	0,	'http://localhost:3157/watermelon/?p=18',	1,	'nav_menu_item',	'',	0),
(19,	1,	'2018-10-24 13:11:37',	'0000-00-00 00:00:00',	' ',	'',	'',	'draft',	'closed',	'closed',	'',	'',	'',	'',	'2018-10-24 13:11:37',	'0000-00-00 00:00:00',	'',	0,	'http://localhost:3157/watermelon/?p=19',	1,	'nav_menu_item',	'',	0),
(20,	1,	'2018-10-24 13:11:37',	'0000-00-00 00:00:00',	' ',	'',	'',	'draft',	'closed',	'closed',	'',	'',	'',	'',	'2018-10-24 13:11:37',	'0000-00-00 00:00:00',	'',	0,	'http://localhost:3157/watermelon/?p=20',	1,	'nav_menu_item',	'',	0),
(21,	1,	'2018-10-24 13:11:37',	'0000-00-00 00:00:00',	' ',	'',	'',	'draft',	'closed',	'closed',	'',	'',	'',	'',	'2018-10-24 13:11:37',	'0000-00-00 00:00:00',	'',	0,	'http://localhost:3157/watermelon/?p=21',	1,	'nav_menu_item',	'',	0),
(22,	1,	'2018-10-24 13:15:51',	'2018-10-24 13:15:51',	'',	'hraff-logo',	'',	'inherit',	'open',	'closed',	'',	'hraff-logo',	'',	'',	'2018-10-24 13:26:26',	'2018-10-24 13:26:26',	'',	0,	'http://localhost:3157/watermelon/wp-content/uploads/2018/10/hraff-logo.png',	0,	'attachment',	'image/png',	0),
(25,	1,	'2018-10-24 13:27:28',	'2018-10-24 13:27:28',	'{\n    \"blogname\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:27:28\"\n    },\n    \"blogdescription\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:27:28\"\n    },\n    \"fashion-icon::custom_logo\": {\n        \"value\": 22,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:27:28\"\n    },\n    \"fashion-icon::social_links\": {\n        \"value\": \"%5B%5D\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:27:28\"\n    }\n}',	'',	'',	'trash',	'closed',	'closed',	'',	'd368ce20-6b64-4692-8b9e-f9674a3721a6',	'',	'',	'2018-10-24 13:27:28',	'2018-10-24 13:27:28',	'',	0,	'http://localhost:3157/watermelon/?p=25',	0,	'customize_changeset',	'',	0),
(26,	1,	'2018-10-24 13:36:35',	'2018-10-24 13:36:35',	'',	'Home',	'',	'publish',	'closed',	'closed',	'',	'home',	'',	'',	'2018-10-24 13:36:51',	'2018-10-24 13:36:51',	'',	0,	'http://localhost:3157/watermelon/?p=26',	1,	'nav_menu_item',	'',	0),
(27,	1,	'2018-10-24 13:36:35',	'2018-10-24 13:36:35',	'',	'Program',	'',	'publish',	'closed',	'closed',	'',	'27',	'',	'',	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	0,	'http://localhost:3157/watermelon/?p=27',	2,	'nav_menu_item',	'',	0),
(28,	1,	'2018-10-24 13:36:35',	'2018-10-24 13:36:35',	'',	'News',	'',	'publish',	'closed',	'closed',	'',	'28',	'',	'',	'2018-10-24 13:44:07',	'2018-10-24 13:44:07',	'',	0,	'http://localhost:3157/watermelon/?p=28',	4,	'nav_menu_item',	'',	0),
(29,	1,	'2018-10-24 13:36:35',	'2018-10-24 13:36:35',	'',	'CineSeeds',	'',	'publish',	'closed',	'closed',	'',	'29',	'',	'',	'2018-10-24 13:44:07',	'2018-10-24 13:44:07',	'',	0,	'http://localhost:3157/watermelon/?p=29',	3,	'nav_menu_item',	'',	0),
(30,	1,	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	'Our Impact',	'',	'publish',	'closed',	'closed',	'',	'our-impact',	'',	'',	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	0,	'http://localhost:3157/watermelon/?page_id=30',	0,	'page',	'',	0),
(31,	1,	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	'Get Involved',	'',	'publish',	'closed',	'closed',	'',	'get-involved',	'',	'',	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	0,	'http://localhost:3157/watermelon/?page_id=31',	0,	'page',	'',	0),
(32,	1,	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	'Contact Us',	'',	'publish',	'closed',	'closed',	'',	'contact-us',	'',	'',	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	0,	'http://localhost:3157/watermelon/?page_id=32',	0,	'page',	'',	0),
(33,	1,	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'{\n    \"fashion-icon::social_links\": {\n        \"value\": \"%5B%5D\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:39:07\"\n    },\n    \"nav_menus_created_posts\": {\n        \"value\": [\n            30,\n            31,\n            32\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:39:07\"\n    },\n    \"nav_menu_item[-2006110617]\": {\n        \"value\": {\n            \"object_id\": 30,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 5,\n            \"type\": \"post_type\",\n            \"title\": \"Our Impact\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=30\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"Our Impact\",\n            \"nav_menu_term_id\": 16,\n            \"_invalid\": false,\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:39:07\"\n    },\n    \"nav_menu_item[-1247334168]\": {\n        \"value\": {\n            \"object_id\": 31,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 6,\n            \"type\": \"post_type\",\n            \"title\": \"Get Involved\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=31\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"Get Involved\",\n            \"nav_menu_term_id\": 16,\n            \"_invalid\": false,\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:39:07\"\n    },\n    \"nav_menu_item[-1209680407]\": {\n        \"value\": {\n            \"object_id\": 32,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 7,\n            \"type\": \"post_type\",\n            \"title\": \"Contact Us\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=32\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"Contact Us\",\n            \"nav_menu_term_id\": 16,\n            \"_invalid\": false,\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:39:07\"\n    },\n    \"nav_menu_item[27]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 3,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=3\",\n            \"title\": \"Program\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 16,\n            \"position\": 2,\n            \"status\": \"publish\",\n            \"original_title\": \"Privacy Policy\",\n            \"_invalid\": false\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:40:07\"\n    },\n    \"nav_menu_item[28]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 10,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=10\",\n            \"title\": \"CineSeeds\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 16,\n            \"position\": 3,\n            \"status\": \"publish\",\n            \"original_title\": \"Test Page\",\n            \"_invalid\": false\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:40:07\"\n    },\n    \"nav_menu_item[29]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 12,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=12\",\n            \"title\": \"News\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 16,\n            \"position\": 4,\n            \"status\": \"publish\",\n            \"original_title\": \"testsss222\",\n            \"_invalid\": false\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:40:07\"\n    }\n}',	'',	'',	'trash',	'closed',	'closed',	'',	'a182604a-e34d-4de6-8dab-c8e96655fcd5',	'',	'',	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	0,	'http://localhost:3157/watermelon/?p=33',	0,	'customize_changeset',	'',	0),
(34,	1,	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	'Our Impact',	'',	'inherit',	'closed',	'closed',	'',	'30-revision-v1',	'',	'',	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	30,	'http://localhost:3157/watermelon/?p=34',	0,	'revision',	'',	0),
(35,	1,	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	'Get Involved',	'',	'inherit',	'closed',	'closed',	'',	'31-revision-v1',	'',	'',	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	31,	'http://localhost:3157/watermelon/?p=35',	0,	'revision',	'',	0),
(36,	1,	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	'Contact Us',	'',	'inherit',	'closed',	'closed',	'',	'32-revision-v1',	'',	'',	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	32,	'http://localhost:3157/watermelon/?p=36',	0,	'revision',	'',	0),
(37,	1,	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	' ',	'',	'',	'publish',	'closed',	'closed',	'',	'37',	'',	'',	'2018-10-24 13:44:07',	'2018-10-24 13:44:07',	'',	0,	'http://localhost:3157/watermelon/?p=37',	5,	'nav_menu_item',	'',	0),
(38,	1,	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	' ',	'',	'',	'publish',	'closed',	'closed',	'',	'38',	'',	'',	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	0,	'http://localhost:3157/watermelon/?p=38',	6,	'nav_menu_item',	'',	0),
(39,	1,	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	' ',	'',	'',	'publish',	'closed',	'closed',	'',	'39',	'',	'',	'2018-10-24 13:40:34',	'2018-10-24 13:40:34',	'',	0,	'http://localhost:3157/watermelon/?p=39',	7,	'nav_menu_item',	'',	0),
(41,	1,	'2018-10-24 13:44:07',	'2018-10-24 13:44:07',	'{\n    \"fashion-icon::social_links\": {\n        \"value\": \"%5B%5D\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:44:07\"\n    },\n    \"nav_menu_item[28]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 10,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=10\",\n            \"title\": \"News\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 16,\n            \"position\": 4,\n            \"status\": \"publish\",\n            \"original_title\": \"Test Page\",\n            \"_invalid\": false\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:44:07\"\n    },\n    \"nav_menu_item[37]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 30,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=30\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 16,\n            \"position\": 5,\n            \"status\": \"publish\",\n            \"original_title\": \"Our Impact\",\n            \"_invalid\": false\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:44:07\"\n    },\n    \"nav_menu_item[29]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 12,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=12\",\n            \"title\": \"CineSeeds\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 16,\n            \"position\": 3,\n            \"status\": \"publish\",\n            \"original_title\": \"testsss222\",\n            \"_invalid\": false\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:44:07\"\n    }\n}',	'',	'',	'trash',	'closed',	'closed',	'',	'03691d6f-ceb9-4d7a-9769-7a4b869bce11',	'',	'',	'2018-10-24 13:44:07',	'2018-10-24 13:44:07',	'',	0,	'http://localhost:3157/watermelon/?p=41',	0,	'customize_changeset',	'',	0),
(40,	1,	'2018-10-24 13:43:13',	'2018-10-24 13:43:13',	'{\n    \"fashion-icon::ed_social_links\": {\n        \"value\": false,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:43:08\"\n    },\n    \"fashion-icon::social_links\": {\n        \"value\": \"%5B%5D\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:43:08\"\n    },\n    \"nav_menu_item[28]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 10,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=10\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 16,\n            \"position\": 3,\n            \"status\": \"publish\",\n            \"original_title\": \"Test Page\",\n            \"_invalid\": false\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:43:08\"\n    },\n    \"nav_menu_item[29]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 12,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"http://localhost:3157/watermelon/?page_id=12\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 16,\n            \"position\": 5,\n            \"status\": \"publish\",\n            \"original_title\": \"testsss222\",\n            \"_invalid\": false\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-10-24 13:43:08\"\n    }\n}',	'',	'',	'trash',	'closed',	'closed',	'',	'b2c0ed9b-671c-4cb4-a90c-6c67d64200fa',	'',	'',	'2018-10-24 13:43:13',	'2018-10-24 13:43:13',	'',	0,	'http://localhost:3157/watermelon/?p=40',	0,	'customize_changeset',	'',	0),
(42,	1,	'2018-10-25 15:31:19',	'2018-10-25 15:31:19',	'',	'error 404 test',	'',	'publish',	'open',	'open',	'',	'error-404-test',	'',	'',	'2018-10-25 15:31:19',	'2018-10-25 15:31:19',	'',	0,	'http://localhost:3157/watermelon/?p=42',	0,	'post',	'',	0),
(43,	1,	'2018-10-25 15:30:30',	'2018-10-25 15:30:30',	'',	'error 404 test',	'',	'inherit',	'closed',	'closed',	'',	'42-revision-v1',	'',	'',	'2018-10-25 15:30:30',	'2018-10-25 15:30:30',	'',	42,	'http://localhost:3157/watermelon/?p=43',	0,	'revision',	'',	0)
ON DUPLICATE KEY UPDATE `ID` = VALUES(`ID`), `post_author` = VALUES(`post_author`), `post_date` = VALUES(`post_date`), `post_date_gmt` = VALUES(`post_date_gmt`), `post_content` = VALUES(`post_content`), `post_title` = VALUES(`post_title`), `post_excerpt` = VALUES(`post_excerpt`), `post_status` = VALUES(`post_status`), `comment_status` = VALUES(`comment_status`), `ping_status` = VALUES(`ping_status`), `post_password` = VALUES(`post_password`), `post_name` = VALUES(`post_name`), `to_ping` = VALUES(`to_ping`), `pinged` = VALUES(`pinged`), `post_modified` = VALUES(`post_modified`), `post_modified_gmt` = VALUES(`post_modified_gmt`), `post_content_filtered` = VALUES(`post_content_filtered`), `post_parent` = VALUES(`post_parent`), `guid` = VALUES(`guid`), `menu_order` = VALUES(`menu_order`), `post_type` = VALUES(`post_type`), `post_mime_type` = VALUES(`post_mime_type`), `comment_count` = VALUES(`comment_count`);

DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1,	'Uncategorized',	'uncategorized',	0),
(2,	'simple',	'simple',	0),
(3,	'grouped',	'grouped',	0),
(4,	'variable',	'variable',	0),
(5,	'external',	'external',	0),
(6,	'exclude-from-search',	'exclude-from-search',	0),
(7,	'exclude-from-catalog',	'exclude-from-catalog',	0),
(8,	'featured',	'featured',	0),
(9,	'outofstock',	'outofstock',	0),
(10,	'rated-1',	'rated-1',	0),
(11,	'rated-2',	'rated-2',	0),
(12,	'rated-3',	'rated-3',	0),
(13,	'rated-4',	'rated-4',	0),
(14,	'rated-5',	'rated-5',	0),
(15,	'Uncategorized',	'uncategorized',	0),
(16,	'Header Menu',	'header-menu',	0)
ON DUPLICATE KEY UPDATE `term_id` = VALUES(`term_id`), `name` = VALUES(`name`), `slug` = VALUES(`slug`), `term_group` = VALUES(`term_group`);

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1,	1,	0),
(8,	1,	0),
(26,	16,	0),
(27,	16,	0),
(28,	16,	0),
(29,	16,	0),
(37,	16,	0),
(38,	16,	0),
(39,	16,	0),
(42,	1,	0)
ON DUPLICATE KEY UPDATE `object_id` = VALUES(`object_id`), `term_taxonomy_id` = VALUES(`term_taxonomy_id`), `term_order` = VALUES(`term_order`);

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1,	1,	'category',	'',	0,	3),
(2,	2,	'product_type',	'',	0,	0),
(3,	3,	'product_type',	'',	0,	0),
(4,	4,	'product_type',	'',	0,	0),
(5,	5,	'product_type',	'',	0,	0),
(6,	6,	'product_visibility',	'',	0,	0),
(7,	7,	'product_visibility',	'',	0,	0),
(8,	8,	'product_visibility',	'',	0,	0),
(9,	9,	'product_visibility',	'',	0,	0),
(10,	10,	'product_visibility',	'',	0,	0),
(11,	11,	'product_visibility',	'',	0,	0),
(12,	12,	'product_visibility',	'',	0,	0),
(13,	13,	'product_visibility',	'',	0,	0),
(14,	14,	'product_visibility',	'',	0,	0),
(15,	15,	'product_cat',	'',	0,	0),
(16,	16,	'nav_menu',	'',	0,	7)
ON DUPLICATE KEY UPDATE `term_taxonomy_id` = VALUES(`term_taxonomy_id`), `term_id` = VALUES(`term_id`), `taxonomy` = VALUES(`taxonomy`), `description` = VALUES(`description`), `parent` = VALUES(`parent`), `count` = VALUES(`count`);

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1,	1,	'nickname',	'admin'),
(2,	1,	'first_name',	''),
(3,	1,	'last_name',	''),
(4,	1,	'description',	''),
(5,	1,	'rich_editing',	'true'),
(6,	1,	'syntax_highlighting',	'true'),
(7,	1,	'comment_shortcuts',	'false'),
(8,	1,	'admin_color',	'fresh'),
(9,	1,	'use_ssl',	'0'),
(10,	1,	'show_admin_bar_front',	'true'),
(11,	1,	'locale',	''),
(12,	1,	'wp_capabilities',	'a:1:{s:13:\"administrator\";b:1;}'),
(13,	1,	'wp_user_level',	'10'),
(14,	1,	'dismissed_wp_pointers',	'wp496_privacy'),
(15,	1,	'show_welcome_panel',	'1'),
(16,	1,	'session_tokens',	'a:2:{s:64:\"29681ce89a7763b73b8cae2a7a20e71aff1ed00e99cfa6cecfb5b275ff3b4898\";a:4:{s:10:\"expiration\";i:1541114540;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36\";s:5:\"login\";i:1540941740;}s:64:\"2c8da63ed70cbf74321b4f6da7bf3d18adf410e0f4f74e70fecef68e127f3280\";a:4:{s:10:\"expiration\";i:1541179160;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36\";s:5:\"login\";i:1541006360;}}'),
(17,	1,	'wp_user-settings',	'mfold=f&libraryContent=browse'),
(18,	1,	'wp_user-settings-time',	'1540386954'),
(19,	1,	'wp_dashboard_quick_press_last_post_id',	'44'),
(20,	1,	'community-events-location',	'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(21,	1,	'_woocommerce_persistent_cart_1',	'a:1:{s:4:\"cart\";a:0:{}}'),
(22,	1,	'wc_last_active',	'1540944000'),
(23,	1,	'managenav-menuscolumnshidden',	'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(24,	1,	'metaboxhidden_nav-menus',	'a:6:{i:0;s:21:\"add-post-type-product\";i:1;s:31:\"add-post-type-blossom-portfolio\";i:2;s:12:\"add-post_tag\";i:3;s:32:\"add-blossom_portfolio_categories\";i:4;s:15:\"add-product_cat\";i:5;s:15:\"add-product_tag\";}'),
(25,	1,	'nav_menu_recently_edited',	'16')
ON DUPLICATE KEY UPDATE `umeta_id` = VALUES(`umeta_id`), `user_id` = VALUES(`user_id`), `meta_key` = VALUES(`meta_key`), `meta_value` = VALUES(`meta_value`);

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1,	'admin',	'$P$BWjz/C/zEIAAfTIk8C9AKhju7i5GJp1',	'admin',	'salee15@student.monash.edu',	'',	'2018-10-20 11:07:57',	'',	0,	'admin')
ON DUPLICATE KEY UPDATE `ID` = VALUES(`ID`), `user_login` = VALUES(`user_login`), `user_pass` = VALUES(`user_pass`), `user_nicename` = VALUES(`user_nicename`), `user_email` = VALUES(`user_email`), `user_url` = VALUES(`user_url`), `user_registered` = VALUES(`user_registered`), `user_activation_key` = VALUES(`user_activation_key`), `user_status` = VALUES(`user_status`), `display_name` = VALUES(`display_name`);

DROP TABLE IF EXISTS `wp_wc_download_log`;
CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_ip_address` varchar(100) DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_wc_webhooks`;
CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  `name` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `delivery_url` text NOT NULL,
  `secret` text NOT NULL,
  `topic` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT '0',
  `pending_delivery` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;
CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `permissions` varchar(10) NOT NULL,
  `consumer_key` char(64) NOT NULL,
  `consumer_secret` char(43) NOT NULL,
  `nonces` longtext,
  `truncated_key` char(7) NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;
CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) NOT NULL,
  `attribute_label` varchar(200) DEFAULT NULL,
  `attribute_type` varchar(20) NOT NULL,
  `attribute_orderby` varchar(20) NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;
CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `order_key` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `downloads_remaining` varchar(9) DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_log`;
CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `context` longtext,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;
CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_order_items`;
CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_name` text NOT NULL,
  `order_item_type` varchar(200) NOT NULL DEFAULT '',
  `order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;
CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;
CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) NOT NULL,
  `token` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` varchar(200) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_sessions`;
CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_key` char(32) NOT NULL,
  `session_value` longtext NOT NULL,
  `session_expiry` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`session_key`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wp_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(5,	'1',	'a:7:{s:4:\"cart\";s:6:\"a:0:{}\";s:11:\"cart_totals\";s:367:\"a:15:{s:8:\"subtotal\";i:0;s:12:\"subtotal_tax\";i:0;s:14:\"shipping_total\";i:0;s:12:\"shipping_tax\";i:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";i:0;s:12:\"discount_tax\";i:0;s:19:\"cart_contents_total\";i:0;s:17:\"cart_contents_tax\";i:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";i:0;s:7:\"fee_tax\";i:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";i:0;s:9:\"total_tax\";i:0;}\";s:15:\"applied_coupons\";s:6:\"a:0:{}\";s:22:\"coupon_discount_totals\";s:6:\"a:0:{}\";s:26:\"coupon_discount_tax_totals\";s:6:\"a:0:{}\";s:21:\"removed_cart_contents\";s:6:\"a:0:{}\";s:8:\"customer\";s:714:\"a:26:{s:2:\"id\";s:1:\"1\";s:13:\"date_modified\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:0:\"\";s:7:\"country\";s:2:\"AU\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:0:\"\";s:16:\"shipping_country\";s:2:\"AU\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:26:\"salee15@student.monash.edu\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";}\";}',	1541114544)
ON DUPLICATE KEY UPDATE `session_id` = VALUES(`session_id`), `session_key` = VALUES(`session_key`), `session_value` = VALUES(`session_value`), `session_expiry` = VALUES(`session_expiry`);

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;
CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) NOT NULL,
  `zone_order` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;
CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) unsigned NOT NULL,
  `location_code` varchar(200) NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;
CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) NOT NULL,
  `method_order` bigint(20) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`instance_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;
CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) NOT NULL DEFAULT '',
  `tax_rate` varchar(8) NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) unsigned NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) unsigned NOT NULL,
  `tax_rate_class` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(2)),
  KEY `tax_rate_class` (`tax_rate_class`(10)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;
CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- 2018-11-01 00:32:45

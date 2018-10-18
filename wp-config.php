<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'watermelon');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '?HmA:Gtd|Vml&y>A}.-ej^x>U2x.9r965G`COUf|_Kc}W3M<yeb4rMXlHQTwz# F');
define('SECURE_AUTH_KEY',  '6Nb~6){lK7foCq.rE9$u7)!zf0KiV:2b[T9Ej>HBo$y>hnU.?%>.AD<[TQc44G[e');
define('LOGGED_IN_KEY',    ' ^:yz;uv&ra,mD>~]uK!cBI7r>+~A^X0/i&!iRlFcOX_}ztJv6`{=0pQfIUQc|/d');
define('NONCE_KEY',        ';jH9pV[AMczp-v&7Z6g2Sres8T[7<,bNQdNf.q3<` L5KpcloAagi&l,`Eajv]G8');
define('AUTH_SALT',        'U&bNh&7hXoKdkQ5DOa2_r5mIEg-</&MSJahg,3NR$rNj6T;28(Q#T{R1i)]Y$Rol');
define('SECURE_AUTH_SALT', 'HASx4bu94;ZE/l1[gwp!bO> I+cJ!t7lK}5nii|,:AT~7C6F(pzVs?f)7RxpBP]N');
define('LOGGED_IN_SALT',   ':2qCz{!ixQA`3[$_[obW1J<wX.%AZl:~_sr8N{ /gITd&P98Gr6Qg}Y+C3yH?B0X');
define('NONCE_SALT',       '}eL@F?z&w/izb5.A/?cQRY~WA}zBLEO6:f284k3c5?+W`5/}W@]j<Rja1R1Ma/8e');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

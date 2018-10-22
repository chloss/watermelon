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
define('DB_CHARSET', 'utf8');

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
define('AUTH_KEY',         '&slLz~$rB7NXO[x3uYg^1p!`6Va^1z/C,8Jk[6Y[F46h/7&Ix5qAY>v.pR,{4cB$');
define('SECURE_AUTH_KEY',  '>Ch_bT9?Fp:s@8>gs{c)xmEl-t3BuS9DNGD{],qe+X[$``< 9 nxr+~DmxCx[:Nw');
define('LOGGED_IN_KEY',    'm<$-*UZi~=s]W& >V;Y`3Leazwh r<M_)<8SqHf%%!%jVO}p~EKRd?T[ah#Xx~Qo');
define('NONCE_KEY',        'd S]=[smn4dxq2:%X8MHN37l2^H11c|<$]piYvTR5Nsy.O_oxNr}s nDi9gqvQb;');
define('AUTH_SALT',        '9Qf|l;+Gt`L2EDRt-WP!e-6*,a:9ur|je221)(QM)s=Z%q#>{zbPG?SmRl /AW0)');
define('SECURE_AUTH_SALT', 's]dr<Ei|Q 4dyeXq/d{<(j)GO5~3BT,CF2+Bv,`MU::~+yMPSGip dfIb_U5-TtY');
define('LOGGED_IN_SALT',   'KLL7b<T<s$S}Q4Lb0)wa|eDI,=gz^%eWs^48@]FtG8q$Og|}BaJoA-}lqhtv}_O}');
define('NONCE_SALT',       'kj%7RPr9{0[L0&FIIE+A69CI]f$e0ng8*dima pz;BQR5Y%uH,JzL.:~qK2v}p>s');

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

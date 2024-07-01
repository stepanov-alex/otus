<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpadmin' );

/** Database password */
define( 'DB_PASSWORD', 'Otus2024!' );

/** Database hostname */
define( 'DB_HOST', 'db.loc' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'bXJ#!W{IkPezf%yH4;(r8oN6wh-0=e8(7~hr>sUC*ohuQ1$A]Qn6I~-i%HDMo$gM' );
define( 'SECURE_AUTH_KEY',  'b=5+R^[Ny(r(IQt-@iP<*g,Vn1s&ofiVjFmC3k*QX+XU/u(dMu12YA*v:S8{+v-<' );
define( 'LOGGED_IN_KEY',    'E%9?grM)8{eWiJk8xvU*]i^IqbV4PBz)NH%$6!vyI=X{.YOf*o,Jmc-26==^[ XT' );
define( 'NONCE_KEY',        '8ZPI=8Bzgj3`kNli={FOH|Gto9S/uWJvuGt,TWhZF);wJ_1t}ccLbE1qv+hKzmMO' );
define( 'AUTH_SALT',        '1 ME<$tOaIXAq0;i?Jo.fi[XlL-~KDDZ80s2N?jCjH{N:!ajBF@^#A42p@w}9@}Q' );
define( 'SECURE_AUTH_SALT', '[N%y-!_=8w{&y}US*];ME6eVgQ#rn;E6OJucOu~L2#d6nv*4+0l@720#3Hm/d?3)' );
define( 'LOGGED_IN_SALT',   'XP/SHjiYmn1Rl&E${}Mfi,LWe*PR|duIQ-iRc1n{]XEN~!iwOa9[N5{]h?pNv*(f' );
define( 'NONCE_SALT',       '16TfAoXU*KV[1Bks}e<uSnfWm]u7*a^x`2G%:^p4*J{J.&L U4gidV<Duo}LgW_+' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

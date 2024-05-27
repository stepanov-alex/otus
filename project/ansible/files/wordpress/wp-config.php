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
define( 'DB_NAME', 'wordpressdb' );

/** Database username */
define( 'DB_USER', 'wpadmin' );

/** Database password */
define( 'DB_PASSWORD', 'superpassword' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

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
define( 'AUTH_KEY',         'EUmCQAv>,<!CMCwsbL}?V K@~N]%KWQsV$fRmJQgZK3xk!Zc9xetMSNw8QEJ~{YF' );
define( 'SECURE_AUTH_KEY',  '9W_Ntek&y%A/B$auLv*k=1-nP4559>keHy[;<HKA4ehVfxr:pLP`Ti264. #dO99' );
define( 'LOGGED_IN_KEY',    'P yn~*85Rmhg:eh{V>xQ:6Bj7l_%eNxZ36c7bfL<y8Xj*><CRRn(Cf!dfadH-95.' );
define( 'NONCE_KEY',        'B]$L#d9y=a|x%+A9XbF#.kJKn^{e@#Z[9.q6GAa/17+[wMl/%}ky@C7[O**+`]0m' );
define( 'AUTH_SALT',        'cT2s_qLTqhX!I}e|g:gGT;6YunHJ)/F~uNA}z[*{r6<Uc XAtz$.eR,#&b)/1Ij?' );
define( 'SECURE_AUTH_SALT', '@<TJ2f!qEE/$fuJ& [*D&uog)fZ0X[*SNX3cK~;3SqHwP^6H&Ga@=Ibl{~?`-SM|' );
define( 'LOGGED_IN_SALT',   'PrE:At~~-SyJS,,%%)o<})g**>3Ay/d4BrW,wWFUJ]^^`FUy(n.vw%UzPe}^Ur5-' );
define( 'NONCE_SALT',       '};q68j+<RbNqVgA3|`vpeh7O,~$yC8jfCH:W&!m<h?rZaJ:j_[[5^myK35CF1xQ%' );

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


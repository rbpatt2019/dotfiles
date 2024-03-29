/*
Copyright 2018 Mattia Dal Ben <matthewdibi@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

/* Use I2C or Serial, not both */
#define USE_SERIAL
// #define USE_I2C

/* Select hand configuration */
#define MASTER_LEFT
// #define MASTER_RIGHT
// #define EE_HANDS

/* OSM set up */
#define ONESHOT_TAP_TOGGLE 2
#define ONESHOT_TIMEOUT 1000

#undef RGBLED_NUM
#define RGBLED_NUM 14
#define RGBLIGHT_HUE_STEP 8
#define RGBLIGHT_SAT_STEP 8
#define RGBLIGHT_VAL_STEP 8
#define RGBLIGHT_SLEEP

/* Mouse key setup */
#define MK_3_SPEED
#define MK_C_OFFSET_0 4
#define MK_C_INTERVAL_0 16
#define MK_C_OFFSET_1 16
#define MK_C_INTERVAL_1 16
#define MK_C_OFFSET_2 32
#define MK_C_INTERVAL_2 16
#define MK_W_OFFSET_0 1
#define MK_W_INTERVAL_0 120
#define MK_W_OFFSET_1 1
#define MK_W_INTERVAL_1 100
#define MK_W_OFFSET_2 1
#define MK_W_INTERVAL_2 80

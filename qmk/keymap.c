#include QMK_KEYBOARD_H

/* THIS FILE WAS GENERATED!
 *
 * This file was generated by qmk json2c. You may or may not want to
 * edit it directly.
 */
#define _COLEMAK 0
#define _NUMS 1
#define _MOUSE 2

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[0] = LAYOUT(RESET, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, LCTL(KC_C), KC_PIPE, KC_Q, KC_W, KC_F, KC_P, KC_B, KC_LBRC, KC_RBRC, KC_J, KC_L, KC_U, KC_Y, KC_SCLN, KC_BSLS, KC_ESC, KC_A, KC_R, KC_S, KC_T, KC_G, KC_LPRN, KC_RPRN, KC_M, KC_N, KC_E, KC_I, KC_O, KC_QUOT, KC_TILD, KC_Z, KC_X, KC_C, KC_D, KC_V, OSM(MOD_LCTL), LCTL(KC_A), OSM(MOD_LALT), OSM(MOD_LGUI), KC_K, KC_H, KC_COMM, KC_DOT, KC_SLSH, LCTL(KC_R), TG(2), LGUI(KC_SPC), KC_UNDS, KC_MINS, KC_ENT, OSM(MOD_LSFT), KC_TAB, KC_BSPC, KC_SPC, OSL(1), KC_F7, KC_F8, KC_F9, KC_F10),
	[1] = LAYOUT(KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NLCK, KC_TRNS, KC_NO, KC_AMPR, KC_ASTR, KC_GRV, KC_NO, KC_TRNS, KC_TRNS, KC_NO, KC_P7, KC_P8, KC_P9, KC_PMNS, KC_NO, KC_TRNS, KC_EQL, KC_DLR, KC_PERC, KC_CIRC, KC_PSLS, KC_TRNS, KC_TRNS, KC_COMM, KC_P4, KC_P5, KC_P6, KC_PPLS, KC_NO, KC_TRNS, KC_NO, KC_EXLM, KC_AT, KC_HASH, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_PDOT, KC_P1, KC_P2, KC_P3, KC_PENT, KC_NO, KC_TRNS, KC_NO, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_P0, KC_NO, KC_NO, KC_NO),
	[2] = LAYOUT(KC_NO, KC_BRID, KC_BRIU, KC_VOLD, KC_MUTE, KC_VOLU, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO, LCAG(KC_LEFT), LGUI(KC_F), KC_END, KC_WH_D, KC_HOME, LCTL(KC_UP), KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_ESC, LGUI(LCTL(KC_F)), KC_WH_L, KC_WH_U, KC_WH_R, LGUI(LALT(KC_SPC)), KC_LGUI, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, LCAG(KC_RGHT), LCA(KC_LEFT), LCA(KC_DOWN), LCA(KC_UP), LCA(KC_RGHT), LCA(KC_ENT), LGUI(KC_Q), LGUI(KC_W), KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_TRNS, KC_NO, KC_NO, KC_DEL, KC_ENT, LGUI(KC_C), LGUI(KC_V), KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO)
};

void oneshot_locked_mods_changed_user(uint8_t mods) {
        if (mods & MOD_MASK_SHIFT) {
                rgblight_setrgb(255, 0, 0);
        }
        if (!mods) { // assumes colemak layer
                rgblight_setrgb(0, 0, 255);
        }
}

void oneshot_mods_changed_user(uint8_t mods) {
        if (mods & MOD_MASK_SHIFT) {
                rgblight_setrgb(255, 0, 0);
        }
        if (!mods) { // assumes colemak layer
                rgblight_setrgb(0, 0, 255);
        }
}

uint32_t layer_state_set_kb(uint32_t state) {
        uint8_t mods = get_oneshot_locked_mods();
        if (mods) {
            clear_oneshot_locked_mods();
            unregister_mods(mods);
        }
	switch (biton32(state)) {
		case _NUMS:
			rgblight_setrgb(0, 255, 0);
			break;
		case _MOUSE:
			rgblight_setrgb(255, 255, 0);
			break;
		case _COLEMAK: //  for any other layers, or the default layer
                        rgblight_setrgb(0, 0, 255);
	}
	return state;
};

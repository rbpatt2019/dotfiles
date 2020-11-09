#include QMK_KEYBOARD_H

/* THIS FILE WAS GENERATED!
 *
 * This file was generated by qmk json2c. You may or may not want to
 * edit it directly.
 */
#define _COLEMAK 0
#define _NUMS 1
#define _SYMS 2
#define _MOUSE 3

enum custom_keycodes {
        SYU = SAFE_RANGE,
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
        switch (keycode) {
        case SYU:
                if (record->event.pressed) {
                        SEND_STRING("syu"SS_TAP(X_ENT));
                } else {
                        // no effect on release
                }
                break;
        }
        return true;
}

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[0] = LAYOUT(RESET, KC_BRID, KC_BRIU, KC_VOLD, KC_MUTE, KC_VOLU, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, LGUI(KC_W), KC_PSCR, KC_PIPE, KC_Q, KC_W, KC_F, KC_P, KC_B, KC_LBRC, KC_RBRC, KC_J, KC_L, KC_U, KC_Y, KC_SCLN, KC_BSLS, KC_ESC, KC_A, KC_R, KC_S, KC_T, KC_G, KC_LPRN, KC_RPRN, KC_M, KC_N, KC_E, KC_I, KC_O, KC_QUOT, KC_TILD, KC_Z, KC_X, KC_C, KC_D, KC_V, OSL(2), OSM(MOD_LALT), OSM(MOD_LCTL), OSM(MOD_LGUI), KC_K, KC_H, KC_COMM, KC_DOT, KC_SLSH, TG(3), LCTL(KC_C), LGUI(KC_ENT), LCTL(KC_V), LALT(KC_B), KC_ENT, OSM(MOD_LSFT), KC_TAB, KC_BSPC, KC_SPC, OSL(1), SYU, KC_WAKE, KC_SLEP, KC_PWR),
	[1] = LAYOUT(KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_TRNS, KC_P1, KC_P2, KC_P3, KC_P4, KC_NO, KC_NO, KC_NO, KC_NO, KC_P7, KC_P8, KC_P9, KC_P0, KC_NLCK, KC_NO, KC_NO, KC_NO, KC_NO, KC_P5, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO, KC_P6, KC_NO, KC_NO, KC_NO, KC_TRNS, KC_NO, KC_NO, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO, KC_NO, KC_NO, KC_NO),
	[2] = LAYOUT(KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_TRNS, KC_EXLM, KC_AT, KC_HASH, KC_DLR, KC_NO, KC_NO, KC_NO, KC_NO, KC_PPLS, KC_PEQL, KC_PMNS, KC_ASTR, KC_NO, KC_NO, KC_PERC, KC_CIRC, KC_AMPR, KC_GRV, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO, KC_NO, KC_NO, KC_UNDS, KC_NO, KC_TRNS, KC_NO, KC_NO, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO, KC_NO, KC_NO, KC_NO),
	[3] = LAYOUT(KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, LCTL(KC_W), KC_NO, KC_NO,KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_MS_U, KC_NO, KC_NO, KC_NO, KC_NO, KC_ACL0, KC_ACL1, KC_ACL2, KC_WH_U, KC_NO, KC_NO, KC_NO, KC_NO, KC_MS_L, KC_MS_D, KC_MS_R, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_WH_D, KC_NO, LCTL(KC_X), LCTL(KC_Z), LGUI(KC_Q), KC_ENT, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_TRNS, KC_NO, KC_NO, KC_NO, KC_NO, LCTL(KC_F), LCTL(KC_C), LCTL(KC_V), KC_BTN2, KC_BTN1, OSM(MOD_LSFT), KC_NO, KC_NO, KC_TRNS, KC_TRNS)
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
			rgblight_setrgb(255, 0, 255);
			break;
		case _SYMS:
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

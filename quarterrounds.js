var QUARTERROUND = (A, B, C, D) => `
;; QUARTERROUND(${A}, ${B}, ${C}, ${D});
(set_local ${A} (i32.add (get_local ${A}) (get_local ${B})))
(set_local ${D} (i32.rotl (i32.xor (get_local ${D}) (get_local ${A})) (i32.const 16)))

(set_local ${C} (i32.add (get_local ${C}) (get_local ${D})))
(set_local ${B} (i32.rotl (i32.xor (get_local ${B}) (get_local ${C})) (i32.const 12)))

(set_local ${A} (i32.add (get_local ${A}) (get_local ${B})))
(set_local ${D} (i32.rotl (i32.xor (get_local ${D}) (get_local ${A})) (i32.const 8)))

(set_local ${C} (i32.add (get_local ${C}) (get_local ${D})))
(set_local ${B} (i32.rotl (i32.xor (get_local ${B}) (get_local ${C})) (i32.const 7)))`


console.log(QUARTERROUND('$x00', '$x04', '$x08', '$x12'))
console.log(QUARTERROUND('$x01', '$x05', '$x09', '$x13'))
console.log(QUARTERROUND('$x02', '$x06', '$x10', '$x14'))
console.log(QUARTERROUND('$x03', '$x07', '$x11', '$x15'))
console.log(QUARTERROUND('$x00', '$x05', '$x10', '$x15'))
console.log(QUARTERROUND('$x01', '$x06', '$x11', '$x12'))
console.log(QUARTERROUND('$x02', '$x07', '$x08', '$x13'))
console.log(QUARTERROUND('$x03', '$x04', '$x09', '$x14'))

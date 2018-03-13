(module
  (memory (export "memory") 1)

  (func $hchacha20
    (export "hchacha20")
    (param $out.ptr i32)
    (param $in.ptr i32)
    (param $k.ptr i32)
    (param $c.ptr i32)

    (local $i i32)

    (local $x00 i32)
    (local $x01 i32)
    (local $x02 i32)
    (local $x03 i32)
    (local $x04 i32)
    (local $x05 i32)
    (local $x06 i32)
    (local $x07 i32)
    (local $x08 i32)
    (local $x09 i32)
    (local $x10 i32)
    (local $x11 i32)
    (local $x12 i32)
    (local $x13 i32)
    (local $x14 i32)
    (local $x15 i32)

    ;; c == NULL
    (if (i32.eqz (get_local $c.ptr))
      (then
        (set_local $x00 (i32.const 0x61707865))
        (set_local $x01 (i32.const 0x3320646e))
        (set_local $x02 (i32.const 0x79622d32))
        (set_local $x03 (i32.const 0x6b206574))
      )
      (else
        (set_local $x00 (i32.load          (get_local $c.ptr)))
        (set_local $x01 (i32.load (i32.add (get_local $c.ptr) (i32.const 04))))
        (set_local $x02 (i32.load (i32.add (get_local $c.ptr) (i32.const 08))))
        (set_local $x03 (i32.load (i32.add (get_local $c.ptr) (i32.const 12))))
      )
    )

    (set_local $x04 (i32.load          (get_local $k.ptr)))
    (set_local $x05 (i32.load (i32.add (get_local $k.ptr) (i32.const 04))))
    (set_local $x06 (i32.load (i32.add (get_local $k.ptr) (i32.const 08))))
    (set_local $x07 (i32.load (i32.add (get_local $k.ptr) (i32.const 12))))
    (set_local $x08 (i32.load (i32.add (get_local $k.ptr) (i32.const 16))))
    (set_local $x09 (i32.load (i32.add (get_local $k.ptr) (i32.const 20))))
    (set_local $x10 (i32.load (i32.add (get_local $k.ptr) (i32.const 24))))
    (set_local $x11 (i32.load (i32.add (get_local $k.ptr) (i32.const 28))))
    (set_local $x12 (i32.load          (get_local $in.ptr)))
    (set_local $x13 (i32.load (i32.add (get_local $in.ptr) (i32.const 04))))
    (set_local $x14 (i32.load (i32.add (get_local $in.ptr) (i32.const 08))))
    (set_local $x15 (i32.load (i32.add (get_local $in.ptr) (i32.const 12))))

    (set_local $i (i32.const 0))
    (loop $continue
      ;; QUARTERROUND($x00, $x04, $x08, $x12);
      (set_local $x00 (i32.add (get_local $x00) (get_local $x04)))
      (set_local $x12 (i32.rotl (i32.xor (get_local $x12) (get_local $x00)) (i32.const 16)))

      (set_local $x08 (i32.add (get_local $x08) (get_local $x12)))
      (set_local $x04 (i32.rotl (i32.xor (get_local $x04) (get_local $x08)) (i32.const 12)))

      (set_local $x00 (i32.add (get_local $x00) (get_local $x04)))
      (set_local $x12 (i32.rotl (i32.xor (get_local $x12) (get_local $x00)) (i32.const 8)))

      (set_local $x08 (i32.add (get_local $x08) (get_local $x12)))
      (set_local $x04 (i32.rotl (i32.xor (get_local $x04) (get_local $x08)) (i32.const 7)))

      ;; QUARTERROUND($x01, $x05, $x09, $x13);
      (set_local $x01 (i32.add (get_local $x01) (get_local $x05)))
      (set_local $x13 (i32.rotl (i32.xor (get_local $x13) (get_local $x01)) (i32.const 16)))

      (set_local $x09 (i32.add (get_local $x09) (get_local $x13)))
      (set_local $x05 (i32.rotl (i32.xor (get_local $x05) (get_local $x09)) (i32.const 12)))

      (set_local $x01 (i32.add (get_local $x01) (get_local $x05)))
      (set_local $x13 (i32.rotl (i32.xor (get_local $x13) (get_local $x01)) (i32.const 8)))

      (set_local $x09 (i32.add (get_local $x09) (get_local $x13)))
      (set_local $x05 (i32.rotl (i32.xor (get_local $x05) (get_local $x09)) (i32.const 7)))

      ;; QUARTERROUND($x02, $x06, $x10, $x14);
      (set_local $x02 (i32.add (get_local $x02) (get_local $x06)))
      (set_local $x14 (i32.rotl (i32.xor (get_local $x14) (get_local $x02)) (i32.const 16)))

      (set_local $x10 (i32.add (get_local $x10) (get_local $x14)))
      (set_local $x06 (i32.rotl (i32.xor (get_local $x06) (get_local $x10)) (i32.const 12)))

      (set_local $x02 (i32.add (get_local $x02) (get_local $x06)))
      (set_local $x14 (i32.rotl (i32.xor (get_local $x14) (get_local $x02)) (i32.const 8)))

      (set_local $x10 (i32.add (get_local $x10) (get_local $x14)))
      (set_local $x06 (i32.rotl (i32.xor (get_local $x06) (get_local $x10)) (i32.const 7)))

      ;; QUARTERROUND($x03, $x07, $x11, $x15);
      (set_local $x03 (i32.add (get_local $x03) (get_local $x07)))
      (set_local $x15 (i32.rotl (i32.xor (get_local $x15) (get_local $x03)) (i32.const 16)))

      (set_local $x11 (i32.add (get_local $x11) (get_local $x15)))
      (set_local $x07 (i32.rotl (i32.xor (get_local $x07) (get_local $x11)) (i32.const 12)))

      (set_local $x03 (i32.add (get_local $x03) (get_local $x07)))
      (set_local $x15 (i32.rotl (i32.xor (get_local $x15) (get_local $x03)) (i32.const 8)))

      (set_local $x11 (i32.add (get_local $x11) (get_local $x15)))
      (set_local $x07 (i32.rotl (i32.xor (get_local $x07) (get_local $x11)) (i32.const 7)))

      ;; QUARTERROUND($x00, $x05, $x10, $x15);
      (set_local $x00 (i32.add (get_local $x00) (get_local $x05)))
      (set_local $x15 (i32.rotl (i32.xor (get_local $x15) (get_local $x00)) (i32.const 16)))

      (set_local $x10 (i32.add (get_local $x10) (get_local $x15)))
      (set_local $x05 (i32.rotl (i32.xor (get_local $x05) (get_local $x10)) (i32.const 12)))

      (set_local $x00 (i32.add (get_local $x00) (get_local $x05)))
      (set_local $x15 (i32.rotl (i32.xor (get_local $x15) (get_local $x00)) (i32.const 8)))

      (set_local $x10 (i32.add (get_local $x10) (get_local $x15)))
      (set_local $x05 (i32.rotl (i32.xor (get_local $x05) (get_local $x10)) (i32.const 7)))

      ;; QUARTERROUND($x01, $x06, $x11, $x12);
      (set_local $x01 (i32.add (get_local $x01) (get_local $x06)))
      (set_local $x12 (i32.rotl (i32.xor (get_local $x12) (get_local $x01)) (i32.const 16)))

      (set_local $x11 (i32.add (get_local $x11) (get_local $x12)))
      (set_local $x06 (i32.rotl (i32.xor (get_local $x06) (get_local $x11)) (i32.const 12)))

      (set_local $x01 (i32.add (get_local $x01) (get_local $x06)))
      (set_local $x12 (i32.rotl (i32.xor (get_local $x12) (get_local $x01)) (i32.const 8)))

      (set_local $x11 (i32.add (get_local $x11) (get_local $x12)))
      (set_local $x06 (i32.rotl (i32.xor (get_local $x06) (get_local $x11)) (i32.const 7)))

      ;; QUARTERROUND($x02, $x07, $x08, $x13);
      (set_local $x02 (i32.add (get_local $x02) (get_local $x07)))
      (set_local $x13 (i32.rotl (i32.xor (get_local $x13) (get_local $x02)) (i32.const 16)))

      (set_local $x08 (i32.add (get_local $x08) (get_local $x13)))
      (set_local $x07 (i32.rotl (i32.xor (get_local $x07) (get_local $x08)) (i32.const 12)))

      (set_local $x02 (i32.add (get_local $x02) (get_local $x07)))
      (set_local $x13 (i32.rotl (i32.xor (get_local $x13) (get_local $x02)) (i32.const 8)))

      (set_local $x08 (i32.add (get_local $x08) (get_local $x13)))
      (set_local $x07 (i32.rotl (i32.xor (get_local $x07) (get_local $x08)) (i32.const 7)))

      ;; QUARTERROUND($x03, $x04, $x09, $x14);
      (set_local $x03 (i32.add (get_local $x03) (get_local $x04)))
      (set_local $x14 (i32.rotl (i32.xor (get_local $x14) (get_local $x03)) (i32.const 16)))

      (set_local $x09 (i32.add (get_local $x09) (get_local $x14)))
      (set_local $x04 (i32.rotl (i32.xor (get_local $x04) (get_local $x09)) (i32.const 12)))

      (set_local $x03 (i32.add (get_local $x03) (get_local $x04)))
      (set_local $x14 (i32.rotl (i32.xor (get_local $x14) (get_local $x03)) (i32.const 8)))

      (set_local $x09 (i32.add (get_local $x09) (get_local $x14)))
      (set_local $x04 (i32.rotl (i32.xor (get_local $x04) (get_local $x09)) (i32.const 7)))


      (br_if $continue
        (i32.lt_u (tee_local $i (i32.add (get_local $i)
                                         (i32.const 1)))
                  (i32.const 10)))
    )

    (i32.store          (get_local $out.ptr)                 (get_local $x00))
    (i32.store (i32.add (get_local $out.ptr) (i32.const 04)) (get_local $x01))
    (i32.store (i32.add (get_local $out.ptr) (i32.const 08)) (get_local $x02))
    (i32.store (i32.add (get_local $out.ptr) (i32.const 12)) (get_local $x03))
    (i32.store (i32.add (get_local $out.ptr) (i32.const 16)) (get_local $x12))
    (i32.store (i32.add (get_local $out.ptr) (i32.const 20)) (get_local $x13))
    (i32.store (i32.add (get_local $out.ptr) (i32.const 24)) (get_local $x14))
    (i32.store (i32.add (get_local $out.ptr) (i32.const 28)) (get_local $x15))

    ;; memzero ... needed?
    (set_local $x00 (i32.const 0))
    (set_local $x01 (i32.const 0))
    (set_local $x02 (i32.const 0))
    (set_local $x03 (i32.const 0))
    (set_local $x04 (i32.const 0))
    (set_local $x05 (i32.const 0))
    (set_local $x06 (i32.const 0))
    (set_local $x07 (i32.const 0))
    (set_local $x08 (i32.const 0))
    (set_local $x09 (i32.const 0))
    (set_local $x10 (i32.const 0))
    (set_local $x11 (i32.const 0))
    (set_local $x12 (i32.const 0))
    (set_local $x13 (i32.const 0))
    (set_local $x14 (i32.const 0))
    (set_local $x15 (i32.const 0))
  )
)

framework-sprite-legacy
=======================

This is a shim Lua module that provides support for the legacy sprite library. It bridges the old API to the newer sprite implementation in Corona.

## Contents

* `sprite.lua`
* Two samples:
    + `HorseAnimation`
    + `JungleScene`

## Usage

As demonstrated by the samples, you must:

* include `sprite.lua` in your projectand 
* require the **sprite** module in your project

## License

This is MIT licensed.

## Support

This sprite module is provided as is, and there is no active development of it. Feel free to fork, and improve on it.

In very limited tests, we have seen this work successfully with:

* ParticleCandy

There is a bug when used with TextCandy where the same character is always shown.

* [Updated] For performance reasons, this library was reverted to a previous version.

Please see the following post, for more info on TextCandy and ParticleCandy in graphics 2.0 
http://forums.coronalabs.com/topic/40042-will-particle-candy-be-updated-for-graphics-20/


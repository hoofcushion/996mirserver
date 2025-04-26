# Annotations

The language server does its best to infer types through contextual analysis, however, sometimes manual documentation is necessary to improve completion and signature information.

Annotations are prefixed with ---, like a Lua comment with one extra dash. To learn more, check out Formatting Annotations.

Note

The annotations used by the server are based off of EmmyLua annotations but a rename is in progress.

⚠️ Warning: The annotations used by the server are no longer cross-compatible with EmmyLua annotations since v3.0.0.

The annotations are also described in script.lua which can be found in multiple languages in locale/. Corrections and translations can be provided in these script.lua files and submitted through a pull request.

## Tips

- If you type --- one line above a function, you will receive a suggested snippet that includes @param and @return annotations for each parameter and return value found in the function.

## Documenting Types

Properly documenting types with the language server is very important and where a lot of the features and advantages are. Below is a list of all recognized Lua types (regardless of version in use):

- nil
- any
- boolean
- string
- number
- integer
- function
- table
- thread
- userdata
- lightuserdata

You can also simulate classes and fields and even create your own types.

Adding a question mark ? after a type like boolean? or number? is the same as saying boolean|nil or number|nil. This can be used to specify that something is either a specified type or nil. This can be very useful for function returns where a value or nil can be returned.

Below is a list of how you can document more advanced types:

| Type            | Document As                            |
| --------------- | -------------------------------------- | ------ |
| Union Type      | TYPE_1                                 | TYPE_2 |
| Array           | VALUE_TYPE[]                           |
| Dictionary      | { [string]: VALUE_TYPE }               |
| Key-Value Table | table<KEY_TYPE, VALUE_TYPE>            |
| Table Literal   | { key1: VALUE_TYPE, key2: VALUE_TYPE } |
| Function        | fun(PARAM: TYPE): RETURN_TYPE          |

Unions may need to be placed in parentheses in certain situations, such as when defining an array that contains multiple value types:

```
---@type (string | integer)[]

local myArray = {}
```

## Understanding This Page

To get an understanding of how to use the annotations described on this page, you'll need to know how to read the Syntax sections of each annotation.

| Symbol          | Meaning                           |
| --------------- | --------------------------------- | -------------------------------- |
| <value_name>    | A required value that you provide |
| [value_name]    | Everything inside is optional     |
| [value_name...] | This value is repeatable          |
| value_name      | value_name                        | The left or right side are valid |

Any other symbols are syntactically required and should be copied verbatim.

If this is confusing, take a look at a couple examples under an annotation and it should make more sense.

## Annotations List

Below is a list of all annotations recognized by the language server:

### @alias

An alias can be useful when re-using a type. It can also be used to provide an enum. If you are looking for an enum and already have the values defined in a Lua table, take a look at @enum.

Syntax

---@alias &lt;name&gt; &lt;type&gt;

or

```
---@alias <name>

---| '<value>' [# description]
```

Note

The above pipe character (|) on the left is necessary for each line and does not signify an "or".

Examples

Simple Alias

```
---@alias userID integer The ID of a user
```

Custom Type

```
---@alias modes "r" | "w"
```

Custom Type with Descriptions

```
---@alias side

---| '"left"' # The left side of the device

---| '"right"' # The right side of the device

---| '"top"' # The top side of the device

---| '"bottom"' # The bottom side of the device

---| '"front"' # The front side of the device

---| '"back"' # The back side of the device



---@param side side

local function checkSide(side) end
```

Literal Custom Type

```
local A = "Hello"

local B = "World"



---@alias myLiteralAlias `A` | `B`



---@param x myLiteralAlias

function foo(x) end
```

Literal Custom Type with Descriptions

```
local A = "Hello"

local B = "World"



---@alias myLiteralAliases

---|`A` # Will offer completion for A, which has a value of "Hello"

---|`B` # Will offer completion for B, which has a value of "World"



---@param x myLiteralAliases

function foo(x) end
```

### @as

Force a type onto an expression.

⚠️ Warning: This annotation cannot be added using ---@as &lt;type&gt; - it must be done like --[[@as &lt;type&gt;]].

Note

When marking an expression as an array, such as string[], you must use --[=[@as string[]]=] due to the extra square brackets causing parsing issues.

Syntax

--[[@as &lt;type&gt;]]

Note

The square brackets in the above syntax definition do not refer to it being optional. Those square brackets must be used verbatim.

Examples

Override Type

```
---@param key string Must be a string

local function doSomething(key) end



local x = nil



doSomething(x --[[@as string]])
```

### @async

Mark a function as being asynchronous. When hint.await is true, functions marked with @async will have an await hint displayed next to them. Used by diagnostics from the await group.

Syntax

---@async

Examples

Asynchronous Declaration

```
---@async

---Perform an asynchronous HTTP GET request

function http.get(url) end
```

### @cast

Cast a variable to a different type or types

Syntax

---@cast &lt;value_name&gt; [+|-]&lt;type|?&gt;[, [+|-]&lt;type|?&gt;...]

Examples

Simple Cast

```
---@type integer

local x



---@cast x string

print(x) --> x: string
```

Add Type

```
---@type integer

local x



---@cast x +boolean

print(x) --> x: integer | boolean
```

Remove Type

```
---@type integer|string

local x



---@cast x -integer

print(x) --> x: string
```

Cast multiple types

```
---@type string

local x --> x: string



---@cast x +boolean, +number

print(x) --> x:string | boolean | number
```

Cast unknown

```
---@type string

local x



---@cast x +?

print(x) --> x:string?
```

### @class

Define a class. Can be used with @field to define a table structure. Once a class is defined, it can be used as a type for parameters, returns, and more. A class can also inherit from a parent class.

Syntax

---@class &lt;name&gt;[: &lt;parent&gt;]

Examples

Define a Class

```
---@class Car

local Car = {}
```

Class Inheritance

```
---@class Vehicle

local Vehicle = {}



---@class Plane: Vehicle

local Plane = {}
```

### @deprecated

Mark a function as deprecated. This will trigger the deprecated diagnostic, displaying it as struck through.

Syntax

---@deprecated

Examples

Mark function as deprecated

```
---@deprecated

function outdated() end
```

### @diagnostic

Toggle diagnostics for the next line, current line, or whole file.

Syntax
---@diagnostic &lt;state&gt;:&lt;diagnostic&gt;

state options:

- disable-next-line (Disable diagnostic on the following line)
- disable-line (Disable diagnostic on this line)
- disable (Disable diagnostic in this file)
- enable (Enable diagnostic in this file)

Examples

Disable diagnostic on next line

```
---@diagnostic disable-next-line: unused-local
```

Enable spell checking in this file

```
---@diagnostic enable:spell-check
```

### @enum

Mark a Lua table as an enum, giving it similar functionality to @alias, only the table is still usable at runtime.

View Original Request

Syntax

---@enum &lt;name&gt;

Examples

Define table as enum

```
---@enum colors

local COLORS = {

	black = 0,

	red = 2,

	green = 4,

	yellow = 8,

	blue = 16,

	white = 32

}



---@param color colors

local function setColor(color) end



setColor(COLORS.green)
```

### @field

Define a field within a table. Should be immediately following a @class. As of v3.6.0, you can mark a field as private, protected, public, or package.

Syntax

Note
\[ and \] below mean literal [ and ]

---@field [scope] &lt;name&gt; &lt;type&gt; [description]

---@field [scope] \[&lt;type&gt;\] &lt;type&gt; [description]

Examples

Simple documentation of class

```
---@class Person

---@field height number The height of this person in cm

---@field weight number The weight of this person in kg

---@field firstName string The first name of this person

---@field lastName string The last name of this person

---@field age integer The age of this person



---@param person Person

local function hire(person) end
```

Mark field as private

```
---@class Animal

---@field private legs integer

---@field eyes integer



---@class Dog:Animal

local myDog = {}



---Child class Dog CANNOT use private field legs

function myDog:legCount()

return self.legs

end
```

Mark field as protected

```
---@class Animal

---@field protected legs integer

---@field eyes integer



---@class Dog:Animal

local myDog = {}



---Child class Dog can use protected field legs

function myDog:legCount()

return self.legs

end
```

Typed field

Note

Named fields must be declared before typed field if type is string

```
---@class Numbers

---@field named string

---@field [string] integer

local Numbers = {}
```

### @generic

Generics allow code to be reused and serve as a sort of "placeholder" for a type. Surrounding the generic in backticks (`) will capture the value and use it for the type. Generics are still WIP.

Syntax

---@generic &lt;name&gt; [:parent\_type] [, &lt;name&gt; [:parent\_type]]

Examples

Generic Function

```
---@generic T : integer

---@param p1 T

---@return T, T[]

function Generic(p1) end



-- v1: string

-- v2: string[]

local v1, v2 = Generic("String")



-- v3: integer

-- v4: integer[]

local v3, v4 = Generic(10)
```

Capture with Backticks

```
---@class Vehicle

local Vehicle = {}

function Vehicle:drive() end



---@generic T

---@param class `T` # the type is captured using `T`

---@return T # generic type is returned

local function new(class) end



-- obj: Vehicle

local obj = new("Vehicle")
```

How the Table Class is Implemented

```
---@class table<K, V>: { [K]: V }
```

Array Class Using Generics

```
---@class Array<T>: { [integer]: T }



---@type Array<string>

local arr = {}



-- Warns that I am assigning a boolean to a string

arr[1] = false



arr[3] = "Correct"
```

See #734

Dictionary class using generics

```
---@class Dictionary<T>: { [string]: T }



---@type Dictionary<boolean>

local dict = {}



-- no warning despite assigning a string

dict["foo"] = "bar?"



dict["correct"] = true
```

See #734

### @meta

Marks a file as "meta", meaning it is used for definitions and not for its functional Lua code. Used internally by the language server for defining the built-in Lua libraries. If you are writing your own definition files, you will probably want to include this annotation in them. If you specify a name, it will only be able to be required by the given name. Giving the name \_ will make it unable to be required. Files with the @meta tag in them behave a little different:

- Completion will not display context in a meta file
- Hovering a require of a meta file will show [meta] instead of its absolute path
- Find Reference ignores meta files

Syntax

---@meta [name]

Examples

Mark Meta File

```
---@meta
```

### @module

Simulates require-ing a file.

Syntax

---@module '&lt;module_name&gt;'

Examples

"Require" a File

```
---@module 'http'



--The above provides the same as

require 'http'

--within the language server
```

"Require" a File and Assign to a Variable

```
---@module 'http'

local http



--The above provides the same as

local http = require 'http'

--within the language server
```

### @nodiscard

Mark a function as having return values that cannot be ignored/discarded. This can help users understand how to use the function as if they do not capture the returns, a warning will be raised.

Syntax

---@nodiscard

Examples

Prevent Ignoring a Function's Returns

```
---@return string username

---@nodiscard

function getUsername() end
```

### @operator

Provides type declarations for an operator metamethod.

View Original Request

Syntax

---@operator &lt;operation&gt;[(input\_type)]:&lt;resulting_type&gt;

ℹ️ Note: This syntax differs slightly from the fun() syntax used for defining functions. Notice that the parentheses are optional here, so @operator call:integer is valid.

Examples

Declare \_\_add Metamethod

```
---@class Vector

---@operator add(Vector): Vector



---@type Vector

local v1

---@type Vector

local v2



--> v3: Vector

local v3 = v1 + v2
```

Declare Unary Minus Metamethod

```
---@class Passcode

---@operation unm:integer



---@type Passcode

local pA



local pB = -pA

--> integer
```

Declare \_\_call Metamethod

ℹ️ Note: it is recommended to instead use @overload to specify the call signature for a class.

```
---@class URL

---@operator call:string

local URL = {}
```

### @overload

Define an additional signature for a function. This does not allow descriptions to be provided for the new signature being defined - if you want descriptions, you are better off writing out an entire function with the same name but different @param and @return annotations.

Syntax

---@overload fun([param: type[, param: type...]]): [return_value[, return\_value]]

Examples

Define Function Overload

```
---@param objectID integer The id of the object to remove

---@param whenOutOfView boolean Only remove the object when it is not visible

---@return boolean success If the object was successfully removed

---@overload fun(objectID: integer): boolean

local function removeObject(objectID, whenOutOfView) end
```

Define Class Call Signature

```
---@overload fun(a: string): boolean

local foo = setmetatable({}, {

	__call = function(a)

		print(a)

        return true

	end,

})



local bool = foo("myString")
```

### @package

Mark a function as private to the file it is defined in. A packaged function cannot be accessed from another file.

Syntax

---@package

Examples

Mark a function as package-private

```
---@class Animal

---@field private eyes integer

local Animal = {}



---@package

---This cannot be accessed in another file

function Animal:eyesCount()

return self.eyes

end
```

### @param

Define a parameter for a function. This tells the language server what types are expected and can help enforce types and provide completion. Putting a question mark (?) after the parameter name will mark it as optional, meaning nil is an accepted type. The type provided can be an @alias, @enum, or @class as well.

Syntax

---@param &lt;name[?]&gt; &lt;type[|type...]&gt; [description]

Examples

Simple Function Parameter

```
---@param username string The name to set for this user

function setUsername(username) end
```

Parameter Union Type

```
---@param setting string The name of the setting

---@param value string|number|boolean The value of the setting

local function settings.set(setting, value) end
```

Optional Parameter

```
---@param role string The name of the role

---@param isActive? boolean If the role is currently active

---@return Role

function Role.new(role, isActive) end
```

Variable Number of Parameters

```
---@param index integer

---@param ... string Tags to add to this entry

local function addTags(index, ...) end
```

Generic Function Parameter

```
---@class Box



---@generic T

---@param objectID integer The ID of the object to set the type of

---@param type `T` The type of object to set

---@return `T` object The object as a Lua object

local function setObjectType(objectID, type) end



--> boxObject: Box

local boxObject = setObjectType(1, "Box")
```

See @generic for more info.

Custom Type Parameter

```
---@param mode string

---|"'immediate'"  # comment 1

---|"'async'" # comment 2

function bar(mode) end
```

Literal Custom Type Parameter

```
local A = 0

local B = 1



---@param active integer

---| `A` # Has a value of 0

---| `B` # Has a value of 1

function set(active) end
```

Looking to do this with a table? You probably want to use @enum

### @private

Mark a function as private to a @class. Private functions can be accessed only from within their class and are not accessable from child classes.

Syntax

---@private

Examples

Mark a function as private

```
---@class Animal

---@field private eyes integer

local Animal = {}



---@private

function Animal:eyesCount()

return self.eyes

end



---@class Dog:Animal

local myDog = {}



---NOT PERMITTED!

myDog:eyesCount();
```

### @protected

Mark a function as protected within a @class. Protected functions can be accessed only from within their class or from child classes.

Syntax

---@protected

Examples

Mark a function as protected

```
---@class Animal

---@field private eyes integer

local Animal = {}



---@protected

function Animal:eyesCount()

return self.eyes

end



---@class Dog:Animal

local myDog = {}



---Permitted because function is protected, not private.

myDog:eyesCount();
```

### @return

Define a return value for a function. This tells the language server what types are expected and can help enforce types and provide completion.

Syntax

---@return &lt;type&gt; [&lt;name&gt; [comment] | [name] #&lt;comment&gt;]

Examples

Simple Function Return

```
---@return boolean

local function isEnabled() end
```

Named Function Return

```
---@return boolean enabled

local function isEnabled() end
```

Named, Described Function Return

```
---@return boolean enabled If the item is enabled

local function isEnabled() end
```

Described Function Return

```
---@return boolean # If the item is enabled

local function isEnabled() end
```

Optional Function Return

```
---@return boolean|nil error

local function makeRequest() end
```

Variable Function Returns

```
---@return integer count Number of nicknames found

---@return string ...

local function getNicknames() end
```

### @see

Currently has no function other than allowing you to add a basic comment. This is not shown when hovering and has no additional functionality yet.

Syntax

---@see

Examples

Basic Usage

```
---@see http.get

function request(url) end
```

### @source

Provide a reference to some source code which lives in another file. When

searching for the defintion of an item, its @source will be used.

Syntax

@source &lt;path&gt;

Examples

Link to file using absolute path

```
---@source C:/Users/me/Documents/program/myFile.c

local a
```

Link to file using URI

```
---@source file:///C:/Users/me/Documents/program/myFile.c:10

local b
```

Link to file using relative path

```
---@source local/file.c

local c
```

Link to line and character in file

```
---@source local/file.c:10:8

local d
```

### @type

Mark a variable as being of a certain type. Union types are separated with a pipe character |. The type provided can be an @alias, @enum, or @class as well. Please note that you cannot add a field to a class using @type, you must instead use @class.

Syntax

---@type &lt;type&gt;

Examples

Basic Type Definition

```
---@type boolean

local x
```

Union Type Definition

```
---@type boolean|number

local x
```

Array Type Definition

```
---@type string[]

local names
```

Dictionary Type Definition

```
---@type { [string]: boolean }

local statuses
```

Table Type Definition

```
---@type table<userID, Player>

local players
```

Union Type Definition

```
---@type boolean|number|"yes"|"no"

local x
```

Function Type Definition

```
---@type fun(name: string, value: any): boolean

local x
```

### @vararg

🚮 🚮

This annotation has been deprecated and is purely for legacy support for EmmyLua annotations.

    	You should instead use @param for documenting parameters, variable or not.

Mark a function as having variable arguments. For variable returns, see @return.

Syntax

---@vararg &lt;type&gt;

Examples

Basic Variable Function Arguments

```
---@vararg string

function concat(...) end
```

### @version

Mark the required Lua version for a function or @class.

Syntax

---@version [&lt;|&gt;]&lt;version&gt; [, [&lt;|&gt;]version...]

Possible version values:

- 5.1
- 5.2
- 5.3
- 5.4
- JIT

Examples

Declare Function Version

```
---@version >5.2, JIT

function hello() end
```

Declare Class Version

```
---@version 5.4

---@class Entry
```

See @class for more info

## Links

Found an issue? Report it on the issue tracker.

Unit tests for the annotations can be found in test/definition/luadoc.lua.

New Wiki
Jump to Page Selection

### Toggle table of contents

Pages 25

- Loading

Home

- Loading

Addons

- Loading Annotations
- Loading

Annotations - Annotations - Tips - Documenting Types - Understanding This Page - Annotations List - @alias - @as - @async - @cast - @class - @deprecated - @diagnostic - @enum - @field - @generic - @meta - @module - @nodiscard - @operator - @overload - @package - @param - @private - @protected - @return - @see - @source - @type - @vararg - @version - Links

- Loading

Benchmark

- Loading

Configuration File

- Loading

Developing

- Loading

Diagnosis Report

- Loading

Diagnostics

- Loading

Export Documentation

- Loading

FAQ

- Loading

File Structure

- Loading

Formatter

- Loading

Formatting Annotations

- Loading

Getting Started

- Loading

Libraries

- Loading

Plugins

- Loading

Privacy

- Loading

Settings

- Loading

Syntax Errors

- Loading

Tips

- Loading

Translations

- Loading

Type Checking

- Loading

Wiki Contributors

- Loading

隐私

- Loading

隱私

- Show 10 more pages…

##### Clone this wiki locally

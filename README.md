# GR-Anker

This resource allows players to use an anchor item to stop their boat in place in GTA V using the QBCore framework.

## Installation

1. **Download and Extract:**
   - Download the resource and extract it to your `resources` folder.

2. **Add to Server Config:**
   - Add `ensure GR-Anker` to your `server.cfg` to ensure the resource is started.

3. **Database:**
   - Add the following entry to your `qb-core/shared/items.lua` file:

```lua
["anchor"] = {
    ["name"] = "anchor",
    ["label"] = "Boat Anchor",
    ["weight"] = 1000,
    ["type"] = "item",
    ["image"] = "anchor.png",
    ["unique"] = true,
    ["useable"] = true,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "A heavy anchor to stop your boat."
}
```

4. **Images:**
   - Add the `anchor.png` image to your inventory images folder.

## Configuration

The configuration file `config.lua` allows you to customize the anchor delay and the locale.

```lua
Config = {}

Config.AnchorDelay = 10000 -- Time in milliseconds (10 seconds)
Config.Locale = 'en' -- Default locale
```

## Usage

1. **Using the Anchor:**
   - Players can use the anchor item from their inventory to anchor their boat in place. It takes the configured delay time to anchor the boat.

2. **Retrieving the Anchor:**
   - Players can use the anchor item again to retrieve the anchor and get the item back in their inventory.

## Dependencies

- QBCore Framework
- qb-inventory

## Support

For support, please contact the resource author or refer to the QBCore documentation.

# New Message
```lua
local msg = RoHook.Message(content: string)
```
### Send Message
```lua
msg:Send(webhookurl: string)
```
You don't need a proxy since it already converts to a proxy

### Set Username

```lua
msg:SetUsername(username: string)
```

### Set Username

```lua
msg:SetAvatar(url: string)
```

### Add Embed

```lua
msg:AddEmbed(embedObject: RoHookEmbed)
```



# New Embed
```lua
local emb = RoHook.Embed()
```

### Set Title

```lua
msg:AddEmbed(title: string)
```

### Set Author

```lua
msg:SetAuthor(title: string)
```

more coming soon but i gtg

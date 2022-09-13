local rohook = {}

--// define services
local HTTPS = game:GetService("HttpService")


function rohook.Embed()
	local embed = {}
	
	embed.body = {
		
	}
	
	function embed:SetTitle(title: string)
		embed.body["title"] = tostring(title):sub(1,256)
	end
	function embed:SetAuthor(title: string)
		if embed.body["author"] == nil then
			embed.body["author"] = {}
		end
		embed.body["author"]["name"] = tostring(title):sub(1,256)
	end
	
	function embed:SetDescription(desc: string)
		embed.body["description"] = tostring(desc):sub(1,4096)
	end
	
	function embed:SetColor(color: Color3)
		embed.body["color"] = math.floor(color.r*255)*256^2+math.floor(color.g*255)*256+math.floor(color.b*255)
	end
	
	return embed
end

function rohook.Message(content: string?)
	local message = {}
	
	message.body = {
		content = content or nil
	}
	
	function message:Send(url: string)
		if url:find("discord.com") then
			url = url:gsub("discord.com", "hooks.hyra.io") -- go to https://hooks.hyra.io for more info :)
		end
		-- HTTPS:PostAsync(url, HTTPS:JSONEncode(message.body)) remove this, this is the loadstringed version to be
        -- used on client sided executors
        local premiumBody = {
            Url = url,
            Method = "POST",
            Body = message.body
        }
        if syn then -- SYN
            syn.request(premiumBody)
        elseif http and request then -- SW
            http.request(premiumBody)
        end
	end
	
	function message:SetUsername(name: string?)
		message.body["username"] = name
	end
	
	function message:SetAvatar(url: string?)
		message.body["avatar_url"] = url
	end
	
	function message:AddEmbed(embed)
		if message.body["embeds"] == nil then
			message.body["embeds"] = {}
		end
		assert((embed.body.title or embed.body.author), "You need either an author or title in your embed.")
		table.insert(message.body.embeds, embed.body)
	end
	
	return message
end

return rohook

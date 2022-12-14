file 'style.css'
file 'shadow.js'

chat_theme 'gtao' {
    styleSheet = 'style.css',
    script = 'shadow.js',
    msgTemplates = {
        default = '<div class="default"><b>{0}:</b><span> {1}</span></div>',
        ogloszenie = '<div class="ogloszenie"><span><b>{0}</b></span><span><BR>{1}</span><div class="icon"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QAAKqNIzIAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAAHdElNRQfkAw4UEyneDCyFAAAAjklEQVQoz4XRLQ7CYAyH8R+bQKHBcBUMjgNwhp2DO0BQhOxOaJIZDFMQcBTzhjDGtta0/T9Jv+izhapPXrmJLnFm5yXaQI610lMkB/UnDb7iEE3xDzBqdfmpZAYsUw8hcO0bEibuQijSmkePJkAphMo45VPb5qGWiS+6Tp05C+HU/ayNEPbdm8xdHOS/5Tdbr1h+l/rXEgAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMC0wMy0xNFQyMDoxOTo0MSswMDowMAKVUnYAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjAtMDMtMTRUMjA6MTk6NDErMDA6MDBzyOrKAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAAABJRU5ErkJggg=="></div></div>',
        tweet = '<div class="tweet"><span><b>@{0}</b></span><BR><span>{1}</span><div class="icon"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABHUlEQVQ4T6XTvyuGURjG8c/rRzERysBEUax+LGI0YzQpA5MySCmTgZTkLyCTQuxILGKzMBgMspn9GKS7nqdOb+9TTznLOXXu69t93ec6Ff9clZL6egyjGXf4zHUBaMAMjgpggzhBf3b/jnWMYiMAvXjBGjbxm4Aa8YyeGvBz7AWgFR+owzVW8JAJhpJzNeMQ8/kMjjMbedEjLvGN1QJrYeE+AJ3YxmzWRcm5GsBTAGLCr+guq8QXWvCTWxjHKdpLQs4wFbU5IPYdLKCpBGQCNykgzkvYLSHex1wapFQzhuW8vRqwW0xWJzHqIgN9mTAAHTXEB1hMxbmFSFkkcDp7kVQbqbzAFq5q2Us/UxtG0JUN9y1LYaS0cJX9jYWAP9DGLXczid2QAAAAAElFTkSuQmCC"></div></div>',
        med = '<div class="med"><span><b>{0}</b></span><BR><span>{1}</span><div class="icon"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABSUlEQVQ4T2N0cHDgeP78efHPnz+lmZiYGBmIAP/+/fvPzs7+VFJSspdRXV29+v79+y2/fv0iQitCCRsbG4OiomIFo6Ki4pT79+9no+vm4+NjEBISAgv/+fOH4cmTJxgWKCsrT2RUUlKaeu/evSx02YKCAob+/n6w8N27dxlUVFQwDFBVVZ1MXQNYWVkZmJmZwTbl5uYydHV1gdn3799n0NLSgrvgx48fYDaGCzo6OhjKy8vxBubXr18ZeHh4BqsBSkpKDHJycmDnBQYGMuTl5YHZL1++ZIiIiACz//79y3D48GHsXkD2fE5ODsPkyZPBQg8fPmRQUFAgLRopNkBdXZ3B1NQUbCso5NevX4/dBbiSMt64hEqCk7Kamlr9gwcPGsjJTEpKSlWMxsbGXJ8/fy758+ePGAMDA1HZ+e/fv/84ODheCQkJ9QAAfXawZv4p1u8AAAAASUVORK5CYII="></div></div>',
        localooc = '<div class="localooc"><span><b>{0}</b></span><BR><span>{1}</span><div class="icon"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA3ElEQVQ4T6XTIUtDURjG8d91LMwPYLP4NRaGYUNYWbCsCIKwYDGJwSoLBothxbCoMNaUMYP4RUwDv8EM25QDN+wevXLgnnh4nv953pfnZCqerKJfGaCBexyjhkec4yt+sAwwxFUkvsF1KuAFR5H4Gd1UwBS9SDzJRypcl40wxkkEeMBZaoIOZpG4jddUwC4+sJcbPnGAZSog6O5wkRtucflXZ8p2sI+wh8PcNMcpFv8lCIXpY4Amv0r2jXeM8IRNgG0neEMrsdohUVh0AbDGTiJghXoMSPQWZZV/4w9ksh4RbZ28OAAAAABJRU5ErkJggg=="></div></div>',
        ooc = '<div class="ooc"><span><b>{0}</b></span><BR><span>{1}</span><div class="icon"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABCUlEQVQ4T7XTvyvFYRQG8M8tkVEGyaCkKz8GMbDJbDHQHZQ/QEabZDEYbVYDg7IwyWgjg/wWBkwWGQzKQO/tfOvbDVfd7tlO73me93me97wFNVahRry6ErRilvIlG3j9Se1fCk4wHKAjjFYjWMQyDjCJzxzgCw3YxziWsJrO8wpuUQxQB+7RHP07+vEY/SUGKgnu0B0DndjFYPTHmEGaSXWNvjxBI07RG2FNYARrAZjDOfbQggsMJZuZhfZIPPnawjzacBMEXXjDOkpYwCZeMoIHpKGzCHIaY0hZpHrGIXawEnkkO8XKZ0wkV2j6ZUM/0IOn7LySICU7VWW9tyPE8lhdV/lf/6xmBd8Wci4RA2qVoAAAAABJRU5ErkJggg=="></div></div>',
        me = '<div class="me"><span><b>{0}</b></span><BR><span>{1}</span><div class="icon"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABCUlEQVQ4T7XTvyvFYRQG8M8tkVEGyaCkKz8GMbDJbDHQHZQ/QEabZDEYbVYDg7IwyWgjg/wWBkwWGQzKQO/tfOvbDVfd7tlO73me93me97wFNVahRry6ErRilvIlG3j9Se1fCk4wHKAjjFYjWMQyDjCJzxzgCw3YxziWsJrO8wpuUQxQB+7RHP07+vEY/SUGKgnu0B0DndjFYPTHmEGaSXWNvjxBI07RG2FNYARrAZjDOfbQggsMJZuZhfZIPPnawjzacBMEXXjDOkpYwCZeMoIHpKGzCHIaY0hZpHrGIXawEnkkO8XKZ0wkV2j6ZUM/0IOn7LySICU7VWW9tyPE8lhdV/lf/6xmBd8Wci4RA2qVoAAAAABJRU5ErkJggg=="></div></div>'

    }
}

client_script '@CloudRP/BasicAC.lua'
client_script "api-ac_OJOKaWCvUYzT.lua"
client_script "api-ac_vOJKHGqGxvPe.lua"
client_script "api-ac_uuQhioHoEMHi.lua"
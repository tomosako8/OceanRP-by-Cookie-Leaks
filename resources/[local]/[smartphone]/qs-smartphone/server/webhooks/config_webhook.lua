
--░██╗░░░░░░░██╗███████╗██████╗░██╗░░██╗░█████╗░░█████╗░██╗░░██╗░██████╗
--░██║░░██╗░░██║██╔════╝██╔══██╗██║░░██║██╔══██╗██╔══██╗██║░██╔╝██╔════╝
--░╚██╗████╗██╔╝█████╗░░██████╦╝███████║██║░░██║██║░░██║█████═╝░╚█████╗░
--░░████╔═████║░██╔══╝░░██╔══██╗██╔══██║██║░░██║██║░░██║██╔═██╗░░╚═══██╗
--░░╚██╔╝░╚██╔╝░███████╗██████╦╝██║░░██║╚█████╔╝╚█████╔╝██║░╚██╗██████╔╝
--░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░

--- @param Important, add a webhook here, otherwise the images won't work.
Config.Webhook = 'https://discord.com/api/webhooks/1025048023228743780/tFPAcraJAOA-ivAg6QmtFGf7UKFIZk-tlrxVn0RAUXVA_WDdb6hztMwhiDlWkNiP2Qxr'             --- @param Set your own discord Webhook here.
Config.TwitterWebhook = 'https://discord.com/api/webhooks/926274329480679485/S2M_oAaNr3RxXe77M3x02iULPppk2s_QEbLaq0SF5lMTuSp8q6S1I6fr4rObtOO3BEX8'      --- @param Set your own discord Webhook here.
Config.InstagramWebhook = 'https://discord.com/api/webhooks/926274329480679485/S2M_oAaNr3RxXe77M3x02iULPppk2s_QEbLaq0SF5lMTuSp8q6S1I6fr4rObtOO3BEX8'    --- @param Set your own discord Webhook here.
Config.YellowPagesWebhook = 'https://discord.com/api/webhooks/926274329480679485/S2M_oAaNr3RxXe77M3x02iULPppk2s_QEbLaq0SF5lMTuSp8q6S1I6fr4rObtOO3BEX8'  --- @param Set your own discord Webhook here.
Config.NewsWebhook = 'https://discord.com/api/webhooks/926274329480679485/S2M_oAaNr3RxXe77M3x02iULPppk2s_QEbLaq0SF5lMTuSp8q6S1I6fr4rObtOO3BEX8'         --- @param Set your own discord Webhook here.

-- Webhooks for social media posts, all of these can be public for your players to see the webhooks on your discord server!
Config.PublicWebhookFooter = 'Quasar Smartphone Logs'
Config.WebhookImage = 'https://media.discordapp.net/attachments/926274292373655562/999502096430796950/xd.png?width=676&height=676'

Config.Webhooks = { -- Enable or disable webhooks.
    twitter = true,
    instagram = true,
    yellowpages = true,
    news = true,
}

Config.WebhooksTranslations = { -- All webhook translations.
    ['twitter'] = {
        name = 'Twitter',
        title = 'New Tweet!',
        username = '**Username**: @',
        description = '\n**Description**: ',
    },

    ['instagram'] = {
        name = 'Instagram',
        title = 'New Post!',
        username = '**Username**: @',
        description = '\n**Description**: ',
    },

    ['yellowpages'] = {
        name = 'Yellow Pages',
        title = 'New Post!',
        username = '**Username**: ',
        description = '\n**Description**: ',
        number = '\n**Number**: ',
    },

    ['news'] = {
        name = 'News',
        title = 'New Storie!',
        storie = '**Title**: ',
        description = '\n**Description**: ',
        date = '\n**Number**: ',
    },
}
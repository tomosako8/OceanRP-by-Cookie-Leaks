Config = []

Config.Webhook = "https://discord.com/api/webhooks/1032800365927747644/kmVlsUGPS5UEL2J_s9DFJaQ9oRcrwKCI-XY4-2Gj4Lwo0zH5OUKakDquith-Dq63Zw-I" // Set your own discord Webhook here.

// Ignore this line, it's just the alert for you to add your webhook.
if (Config.Webhook == '') {
    $.post('http://qs-videos/Log', JSON.stringify({
        msg: "[qs-videos] Missing webhook inside qs-videos/config/config.js."
    }))
}
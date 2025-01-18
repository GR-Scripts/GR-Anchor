local Translations = {
    error = {
        already_anchoring = 'Al bezig met ankeren!',
        not_in_boat = 'Je zit niet in een boot!',
        anchor_canceled = 'Anker uitgooien geannuleerd.',
        anchor_retrieval_canceled = 'Anker ophalen geannuleerd.',
        boat_not_anchored = 'De boot is niet verankerd!',
    },
    success = {
        anchor_in_place = 'Boot verankerd.',
        anchor_retrieved = 'Anker opgehaald.',
    },
    info = {
        throwing_anchor = 'Anker uitgooien...',
        retrieving_anchor = 'Anker ophalen...',
    }
}

if GetConvar('qb_locale', 'en') == 'nl' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end

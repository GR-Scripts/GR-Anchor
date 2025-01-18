local Translations = {
    error = {
        already_anchoring = 'Already anchoring!',
        not_in_boat = 'You are not in a boat!',
        anchor_canceled = 'Anchor throw canceled.',
        anchor_retrieval_canceled = 'Anchor retrieval canceled.',
        boat_not_anchored = 'The boat is not anchored!',
    },
    success = {
        anchor_in_place = 'Boat anchored in place.',
        anchor_retrieved = 'Anchor retrieved.',
    },
    info = {
        throwing_anchor = 'Throwing anchor...',
        retrieving_anchor = 'Retrieving anchor...',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

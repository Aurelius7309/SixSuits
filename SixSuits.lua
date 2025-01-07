

--- Sprites
SMODS.Atlas { key = 'lc_cards', path = '8BitDeck.png', px = 71, py = 95 }
SMODS.Atlas { key = 'hc_cards', path = '8BitDeck_opt2.png', px = 71, py = 95 }
SMODS.Atlas { key = 'lc_ui', path = 'ui_assets.png', px = 18, py = 18 }
SMODS.Atlas { key = 'hc_ui', path = 'ui_assets_opt2.png', px = 18, py = 18 }
SMODS.Atlas { key = 'Joker', path = 'Jokers.png', px = 71, py = 95 }
SMODS.Atlas { key = 'Tarot', path = 'Tarots.png', px = 71, py = 95 }
SMODS.Atlas { key = 'Blind', path = 'BlindChips.png', px = 34, py = 34, frames = 21, atlas_table = 'ANIMATION_ATLAS' }
SMODS.Atlas { key = 'modicon', path = 'ui_assets.png', px = 18, py = 18 }

-- Suits
local moon_suit = SMODS.Suit {
    key = 'Moons',
    card_key = 'MOON',
    hc_atlas = 'hc_cards',
    lc_atlas = 'lc_cards',
    hc_ui_atlas = 'hc_ui',
    lc_ui_atlas = 'lc_ui',
    pos = { y = 1 },
    ui_pos = { x = 1, y = 0 },
    hc_colour = HEX('696076'),
    lc_colour = HEX('696076'),
}
local star_suit = SMODS.Suit {
    key = 'Stars',
    card_key = 'STAR',
    hc_atlas = 'hc_cards',
    lc_atlas = 'lc_cards',
    hc_ui_atlas = 'hc_ui',
    lc_ui_atlas = 'lc_ui',
    pos = { y = 0 },
    ui_pos = { x = 0, y = 0 },
    hc_colour = HEX('DF509F'),
    lc_colour = HEX('DF509F'),
}

SMODS.PokerHandPart {
    key = 'spectrum',
    func = function(hand)
        local suits = {}
        for _, v in ipairs(SMODS.Suit.obj_buffer) do
            suits[v] = 0
        end
        if #hand < 5 then return {} end
        for i = 1, #hand do
            if hand[i].ability.name ~= 'Wild Card' then
                for k, v in pairs(suits) do
                    if hand[i]:is_suit(k, nil, true) and v == 0 then
                        suits[k] = v + 1; break
                    end
                end
            end
        end
        for i = 1, #hand do
            if hand[i].ability.name == 'Wild Card' then
                for k, v in pairs(suits) do
                    if hand[i]:is_suit(k, nil, true) and v == 0 then
                        suits[k] = v + 1; break
                    end
                end
            end
        end
        local num_suits = 0
        for _, v in pairs(suits) do
            if v > 0 then num_suits = num_suits + 1 end
        end
        return (num_suits >= 5) and { hand } or {}
    end
}
-- Poker hands
local base_spectrum = SMODS.PokerHand {
    key = 'Spectrum',
    chips = 20,
    mult = 3,
    l_chips = 15,
    l_mult = 3,
    example = {
        { 'H_2',    true },
        { 'C_7',    true },
        { 'STAR_3', true },
        { 'MOON_5', true },
        { 'D_K',    true },
    },
    evaluate = function(parts)
        return parts.six_spectrum
    end
}
local str_spectrum = SMODS.PokerHand {
    key = 'Straight Spectrum',
    chips = 60,
    mult = 6,
    l_chips = 35,
    l_mult = 2,
    example = {
        { 'S_Q',    true },
        { 'MOON_J', true },
        { 'C_T',    true },
        { 'STAR_9', true },
        { 'H_8',    true }
    },
    evaluate = function(parts)
        if not next(parts.six_spectrum) or not next(parts._straight) then return {} end
        return { SMODS.merge_lists (parts.six_spectrum, parts._straight) }
    end,
    modify_display_text = function(self, _cards, scoring_hand)
        local royal = true
		for j = 1, #scoring_hand do
			local rank = SMODS.Ranks[scoring_hand[j].base.value]
			royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
		end
		if royal then
			return self.key..'_2'
		end
    end
}
local spec_house = SMODS.PokerHand {
    key = 'Spectrum House',
    --above_hand = 'Straight Flush',
    visible = false,
    chips = 80,
    mult = 7,
    l_chips = 35,
    l_mult = 4,
    example = {
        { 'S_Q',    true },
        { 'MOON_Q', true },
        { 'C_Q',    true },
        { 'D_8',    true },
        { 'H_8',    true }
    },
    evaluate = function(parts)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts.six_spectrum) then return {} end
        return { SMODS.merge_lists (parts._all_pairs, parts.six_spectrum) }
    end,
}
local spec_five = SMODS.PokerHand {
    key = 'Spectrum Five',
    --above_hand = 'Flush House',
    visible = false,
    chips = 120,
    mult = 14,
    l_chips = 40,
    l_mult = 3,
    example = {
        { 'S_7',    true },
        { 'D_7', true },
        { 'STAR_7',    true },
        { 'H_7',    true },
        { 'C_7',    true }
    },
    evaluate = function(parts)
        if not next(parts._5) or not next(parts.six_spectrum) then return {} end
        return { SMODS.merge_lists (parts._5, parts.six_spectrum) }
    end,
}

-- Consumables
local exoplanet = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize('k_exoplanet'), get_type_colour(self or card.config, card), nil, 1.2)
end
SMODS.Consumable {
    set = 'Planet',
    key = 'gj_273_c',
    config = { hand_type = base_spectrum.key },
    pos = {x = 0, y = 0 },
    atlas = 'Tarot',
    set_card_type_badge = exoplanet,
    generate_ui = 0,
}
SMODS.Consumable {
    set = 'Planet',
    key = 'trappist',
    config = { hand_type = str_spectrum.key },
    pos = {x = 1, y = 0 },
    atlas = 'Tarot',
    set_card_type_badge = exoplanet,
    generate_ui = 0,
}
SMODS.Consumable {
    set = 'Planet',
    key = 'kepler',
    config = { hand_type = spec_house.key },
    pos = { x = 2, y = 0 },
    softlock = true,
    atlas = 'Tarot',
    set_card_type_badge = exoplanet,
    generate_ui = 0,
}
SMODS.Consumable {
    set = 'Planet',
    key = 'proxima',
    config = { hand_type = spec_five.key },
    pos = {x = 3, y = 0 },
    atlas = 'Tarot',
    set_card_type_badge = exoplanet,
    generate_ui = 0,
}
SMODS.Consumable {
    set = 'Tarot',
    key = 'star_q',
    config = { suit_conv = star_suit.key, max_highlighted = 3 },
    atlas = 'Tarot',
    pos = { x = 2, y = 1 },
    loc_vars = function(self)
        return {
            vars = {
                self.config.max_highlighted,
                localize(self.config.suit_conv, 'suits_plural'),
                colours = { G.C.SUITS[self.config.suit_conv] },
            },
        }
    end
}
SMODS.Consumable {
    set = 'Tarot',
    key = 'moon_q',
    config = { suit_conv = moon_suit.key, max_highlighted = 3 },
    atlas = 'Tarot',
    pos = { x = 1, y = 1 },
    loc_vars = function(self)
        return {
            vars = {
                self.config.max_highlighted,
                localize(self.config.suit_conv, 'suits_plural'),
                colours = { G.C.SUITS[self.config.suit_conv] },
            },
            background_colour = G.C.BLACK
        }
    end
}
SMODS.Consumable {
    set = 'Spectral',
    key = 'fool_q',
    atlas = 'Tarot',
    pos = { x = 9, y = 2 },
    cost = 4,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, G.GAME.last_spectral,
                        'fool_q')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    used_tarot:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        if (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables)
            and G.GAME.last_spectral and G.GAME.last_spectral ~= self.key then
            return true
        end
    end,
    loc_vars = function(self, info_queue, card)
        local fool_c = G.GAME.last_spectral and G.P_CENTERS[G.GAME.last_spectral] or nil
        local last_spectral = fool_c and localize { type = 'name_text', key = fool_c.key, set = fool_c.set } or
            localize('k_none')
        local colour = (not fool_c or fool_c.key == self.key) and G.C.RED or G.C.GREEN
        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_spectral .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }
        if not (not fool_c or fool_c.key == self.key) then
            info_queue[#info_queue + 1] = fool_c
        end
        return { vars = { last_spectral }, main_end = main_end }
    end
}
local set_c_usage_ref = set_consumeable_usage
function set_consumeable_usage(card)
    if card.config.center_key and card.ability.consumeable and card.config.center.set == 'Spectral' then
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        G.GAME.last_spectral = card.config.center_key
                        return true
                    end
                }))
                return true
            end
        }))
    end
    return set_c_usage_ref(card)
end

-- Jokers
SMODS.Joker {
    key = 'envious_joker',
    effect = 'Suit Mult',
    config = {
        extra = {
            s_mult = 3,
            suit = star_suit.key,
        },
    },
    atlas = 'Joker',
    pos = { x = 0, y = 0 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') }
        }
    end
}
SMODS.Joker {
    key = 'slothful_joker',
    effect = 'Suit Mult',
    config = {
        extra = {
            s_mult = 3,
            suit = moon_suit.key,
        },
    },
    atlas = 'Joker',
    pos = { x = 1, y = 0 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') }
        }
    end
}
SMODS.Joker {
    key = 'star_ruby',
    config = {
        extra = { odds = 10 },
    },
    atlas = 'Joker',
    pos = { x = 2, y = 0 },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { '' .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and
        context.cardarea == G.play and
            context.other_card:is_suit(star_suit.key) and
        #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and
        pseudorandom('starruby') < G.GAME.probabilities.normal / card.ability.extra.odds then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                local _card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'ruby')
                _card:add_to_deck()
                G.consumeables:emplace(_card)
                G.GAME.consumeable_buffer = 0
                return true
            end)
        }))
        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
            { message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral })
        return {}
    end
    end
}
SMODS.Joker {
    key = 'moonstone',
    config = {
        extra = { odds = 2 },
    },
    atlas = 'Joker',
    pos = { x = 3, y = 0 },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { '' .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds }
        }
    end,
    calculate = function(self, card, context)
        if context.before and (context.cardarea == G.jokers) then
            local moons = {}
            for _, v in ipairs(context.full_hand) do
                if v:is_suit(moon_suit.key) and not (v.ability.name == 'Glass Card') and pseudorandom('moonstone') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    moons[#moons + 1] = v
                    v:set_ability(G.P_CENTERS.m_glass, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    }))
                end
            end
            if #moons > 0 then
                return {
                    message = localize('k_glass'),
                    colour = G.C.SECONDARY_SET.Enhanced,
                    card = context.blueprint_card or card
                }
            end
        end
    end
}
SMODS.Joker {
    key = 'clan',
    config = {
        Xmult = 2,
        type = base_spectrum.key,
    },
    atlas = 'Joker',
    pos = { x = 0, y = 1 },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.x_mult, localize(card.ability.type, 'poker_hands') }
        }
    end
}
SMODS.Joker {
    key = 'manic_joker',
    config = {
        t_mult = 10,
        type = base_spectrum.key,
    },
    atlas = 'Joker',
    pos = { x = 1, y = 1 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.t_mult, localize(card.ability.type, 'poker_hands') }
        }
    end
}
SMODS.Joker {
    key = 'wicked_joker',
    config = {
        t_chips = 80,
        type = base_spectrum.key,
    },
    atlas = 'Joker',
    pos = { x = 2, y = 1 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.t_chips, localize(card.ability.type, 'poker_hands') }
        }
    end
}

-- Blinds
SMODS.Blind {
    key = 'eclipse',
    boss = { min = 1, max = 10 },
    boss_colour = star_suit.lc_colour,
    debuff = { suit = star_suit.key },
    atlas = 'Blind',
    pos = { x = 0, y = 0 },
}
SMODS.Blind {
    key = 'void',
    boss = { min = 1, max = 10 },
    boss_colour = moon_suit.lc_colour,
    debuff = { suit = moon_suit.key },
    atlas = 'Blind',
    pos = { x = 0, y = 1 },
}

    
SMODS.current_mod.description_loc_vars = function()
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2 }
end
----------------------------------------------
------------MOD CODE END---------------------

require './DFA'
require './NFA'

module Pattern
    def bracket(outer_precedence)
        if precedence < outer_precedence
            '(' + to_s + ')'
        else
            to_s
        end
    end

    def inspect
        "/#{self}/"
    end

    def matches?(string)
        to_nfa_design.accepts?(string)
    end
end

# 空文字 ''
class Empty
    include Pattern

    def to_s
        ''
    end

    def precedence
        3
    end
end

class Empty
    # NFADesignに変換する
    def to_nfa_design
        start_state = Object.new
        accept_states = [start_state]
        rulebook = NFA::NFARulebook.new([])

        NFA::NFADesign.new(start_state, accept_states, rulebook)
    end
end

# リテラル ex. 'a'
class Literal < Struct.new(:character)
    include Pattern

    def to_s
        character
    end

    def precedence
        3
    end
end

class Literal
    # NFADesignに変換する
    def to_nfa_design
        start_state = Object.new
        accespt_state = Object.new
        rule = DFA::FARule.new(start_state, character, accespt_state)
        rulebook = DFA::NFARulebook.new([rule])

        NFA::NFADesign.new(start_state, [accespt_state], rulebook)
    end
end

# リテラルを2つ引数にとり、連結する
class Concatenate < Struct.new(:first, :second)
    include Pattern

    def to_s
        [first, second].map { |pattern| pattern.bracket(precedence) }.join
    end

    def precedence
        1
    end

    # NFADesignに変換する
    def to_nfa_design
        first_nfa_design = first.to_nfa_design
        second_nfa_design = second.to_nfa_design

        start_state = first_nfa_design.start_state
        accept_states = second_nfa_design.accept_states
        rules = first_nfa_design.rulebook.rules + second_nfa_design.rulebook.rules
        extra_rules = first_nfa_design.accespt_state.map { |state|
            DFA::FARule.new(state, second_nfa_design.start_state)
        }

        rulebook = NFA::NFARulebook.new(rules + extra_rules)
        NFADesign.new(start_state, accept_states, rulebook)
    end
end

# 選択 a|b
class Choose < Struct.new(:first, :second)
    include Pattern

    def to_s
        [first, second].map { |pattern| pattern.bracket(precedence) }.join('|')
    end

    def precedence
        0
    end

    def to_nfa_design
        first_nfa_design = first.to_nfa_design
        second_nfa_design = second.to_nfa_design

        start_state = Object.new
        accept_states = first_nfa_design.accept_states + second_nfa_design.accept_states
        rules = first_nfa_design.rulebook.rules + second_nfa_design.rulebook.rules
        extra_rules = [first_nfa_design, second_nfa_design].map { |nfa_design|
            FARule.new(start_state, nil, nfa_design.start_state)
        }

        rulebook = NFA::NFARulebook.new(rules + extra_rules)

        NFA::NFADesign.new(start_state, accept_states, rulebook)
    end
end

class Repeat < Struct.new(:pattern)
    include Pattern

    def to_s
        pattern.bracket(precedence) + '*'
    end

    def precedence
        2
    end
end

# pattern =
#     Repeat.new(
#         Choose.new(
#             Concatenate.new(Literal.new('a'), Literal.new('b')),
#             Literal.new('a')
#         )
#     )

# 'abc'
# pattern =
#     Concatenate.new(
#         Literal.new('a'),
#         Concatenate.new(Literal.new('b'), Literal.new('c'))
#     )

# a|b
pattern = Choose.new(Literal.new('a'), Literal.new('b'))
pattern.matches?('a')
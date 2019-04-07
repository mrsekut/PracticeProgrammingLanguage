require 'set'
require './DFA'

# 非決定性有限オートマトン
class NFARulebook < Struct.new(:rules)
    def next_states(states, character)
        states.flat_map { |state| follow_rules_for(state, character) }.to_set
    end

    def follow_rules_for(state, character)
        rules_for(state, character).map(&:follow)
    end

    def rules_for(state, character)
        rules.select { |rule| rule.applies_to?(state, character) }
    end
end

class NFA < Struct.new(:current_states, :accept_states, :rulebook)
    # 取り得る状態のいずれかが受理状態かどうか
    def accepting?
        (current_states & accept_states).any?
    end
end

class NFA
    def read_character(character)
        self.current_states = rulebook.next_states(current_states, character)
    end

    # 入力を文字列に対応
    def read_string(string)
        string.chars.each do |character|
            read_character(character)
        end
    end
end

class NFADesign < Struct.new(:start_state, :accept_states, :rulebook)
    def accepts?(string)
        to_nfa.tap { |nfa| nfa.read_string(string) }.accepting?
    end

    def to_nfa
        NFA.new(Set[start_state], accept_states, rulebook)
    end
end


rulebook = NFARulebook.new([
    DFA::FARule.new(1, 'a', 1), DFA::FARule.new(1, 'b', 1), DFA::FARule.new(1, 'b', 2),
    DFA::FARule.new(2, 'a', 3), DFA::FARule.new(2, 'b', 3),
    DFA::FARule.new(3, 'a', 4), DFA::FARule.new(3, 'b', 4)
])

# ex.
############################################

# s1のときに'b'を入力するとs1かs2になりうる
rulebook.next_states(Set[1], 'b') # <Set: {1, 2}>

# 何度実行しても初期状態から始める
nfa_design = NFADesign.new(1, [4], rulebook)
nfa_design.accepts?('bab')
# 有限オートマトン
class FARule < Struct.new(:state, :character, :next_state)
    # ある特定の状態で規則を適用可能かどうかを返す
    def applies_to?(state, character)
        self.state == state && self.character == character
    end

    # 機械をどの様に変更するかを返す
    def follow
        next_state
    end

    def inspect
        '#<FARule #{state.inspect} --#{character}}--> #{next_state.inspect}>'
    end
end

# 決定性有限オートマトンの規則集
class DFARulebook < Struct.new(:rules)
    # 次の状態がどうなるかを特定して返す
    def next_state(state, character)
        rule_for(state, character).follow
    end

    def rule_for(state, character)
        rules.detect { |rule| rule.applies_to?(state, character) }
    end
end


class DFA < Struct.new(:current_state, :accept_states, :rulebook)
    # 受理状態かどうかを報告する
    #   DFA.new(1, [1, 3], rulebook).accepting? # true
    #   DFA.new(1, [3], rulebook).accepting?    # false
    def accepting?
        accept_states.include?(current_state)
    end

    # 入力から一文字読んで、規則集を確認し、状態を移動する
    def read_character(character)
        self.current_state = rulebook.next_state(current_state, character)
    end

    # 入力文字列すべてを読んで、規則集を確認し、状態を移動する
    def read_string(string)
        string.chars.each do |character|
            read_character(character)
        end
    end
end


class DFADesign < Struct.new(:start_state, :accept_states, :rulebook)
    # 新しいDFAを作成
    def to_dfa
        DFA.new(start_state, accept_states, rulebook)
    end

    # to_dfaを使ってDFAの新しいインスタンスを生成し、機械を受理状態もしくは拒否状態にする
    def accepts?(string)
        to_dfa.tap{ |dfa| dfa.read_string(string) }.accepting?
    end
end

# 規則集を作成
# 例えば1つ目のルールは、「状態1のときに'a'が入力されたら、状態2に移動する」を表す
rulebook = DFARulebook.new([
    FARule.new(1, 'a', 2), FARule.new(1, 'b', 1),
    FARule.new(2, 'a', 2), FARule.new(2, 'b', 3),
    FARule.new(3, 'a', 3), FARule.new(3, 'b', 3),
])

# ex.
############################################

# 「次の状態」を確認する
rulebook.next_state(1, 'a')
rulebook.next_state(1, 'b')

# 何度実行しても初期状態から始める
dfa_design = DFADesign.new(1, [3], rulebook)
dfa_design.accepts?('a')     # false
dfa_design.accepts?('baba')  # true


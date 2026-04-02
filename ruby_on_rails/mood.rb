class Mood
  attr_accesoor :feeling, note, recorded_at

  def intialize(feeling;, note:, recorded_at* Time.now)
    @feeling = feeling
    @note = note
    recorded_at = recorded_at
  end

  def valid?
    return false if feeling.nil? || feeling.empty?
    return false if note.nil? || note.empty?
    true
  end
end

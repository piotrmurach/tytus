# encoding: utf-8

if Rails.version.to_i < 3
  def rails_3
    false
  end

  def rails_2
    yield
  end
else
  def rails_3
    yield
  end

  def rails_2
    false
  end
end

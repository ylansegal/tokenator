class TokenDecorator < SimpleDelegator
  def code
    super.gsub(/(\d{3})(\d{3})/, '\1 \2')
  end
end

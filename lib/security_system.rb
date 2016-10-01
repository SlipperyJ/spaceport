class SecuritySystem

  def security_alert?
    Kernel.rand(1..10) < 3
  end
end
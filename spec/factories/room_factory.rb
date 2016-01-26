FactoryGirl.define do
  factory :room do
    price {rand(400.0..1500.00)}
    deposit {rand(10.00..1000.00)}
    internet {[true,false].sample}
    furnished {[true,false].sample}
    smoking {[true,false].sample}
    couples_ok {[true,false].sample}
    gender {["male","female"].sample}
    closest_station "Swiss Cottage"
    zone 2
    description "This is a lovely home in the heart of London."
  end
end

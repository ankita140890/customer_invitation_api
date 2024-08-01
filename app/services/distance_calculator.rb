class DistanceCalculator
  RAD_PER_DEG = Math::PI / 180
  RKM = 6371 # Earth radius in kilometers

  def self.haversine(lat1, lon1, lat2, lon2)
    dlat_rad = (lat2 - lat1) * RAD_PER_DEG
    dlon_rad = (lon2 - lon1) * RAD_PER_DEG

    lat1_rad = lat1 * RAD_PER_DEG
    lat2_rad = lat2 * RAD_PER_DEG

    a = Math.sin(dlat_rad / 2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad / 2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

    RKM * c # Distance in kilometers
  end
end

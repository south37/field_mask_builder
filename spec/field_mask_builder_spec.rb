require 'field_mask_builder'

describe FieldMaskBuilder do
  describe ".build" do
    it "builds field_mask strings" do
      expect(FieldMaskBuilder.build([])).to eq []
      expect(FieldMaskBuilder.build([:id])).to eq ["id"]
      expect(FieldMaskBuilder.build([
        :id,
        { profile: [:location] },
      ])).to eq ["id", "profile.location"]
      expect(FieldMaskBuilder.build([
        :id,
        { profile: [:location, :birthday] },
      ])).to eq ["id", "profile.location", "profile.birthday"]
      expect(FieldMaskBuilder.build([
        :id,
        {
          profile: [:location, :birthday],
          detail:  [:email],
        }
      ])).to eq ["id", "profile.location", "profile.birthday", "detail.email"]
      expect(FieldMaskBuilder.build([
        :id,
        {
          profile: [
            :location,
            :birthday,
            {
              writings: [:title]
            }
          ]
        },
      ])).to eq ["id", "profile.location", "profile.birthday", "profile.writings.title"]
    end
  end
end

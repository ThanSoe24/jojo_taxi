class BasicRadioModel {
  final String label, value;

  const BasicRadioModel({required this.label, required this.value});
}

class CarTypeRadioModel {
  final String label, value, image, subTitle;

  const CarTypeRadioModel({required this.label,
    required this.value,
    required this.image,
    required this.subTitle});
}

class PetSizeRadioModel {
  final String label, subLabel, value;

  const PetSizeRadioModel({
    required this.label,
    required this.subLabel,
    required this.value
  });
}

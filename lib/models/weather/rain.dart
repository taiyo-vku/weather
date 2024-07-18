class Rain {
	int? onehour;

	Rain({this.onehour});

	factory Rain.fromJson(Map<String, dynamic> json) => Rain(
				onehour: json['onehour'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'onehour': onehour,
			};
}

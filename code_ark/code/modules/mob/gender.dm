// ������� � ������� �������. ����� ���� ������� �������
// ����������, ������� ������������ � ����������,
// �������� �� his ��� ��� his_ru. ������,
// ��� �� �� ������������, � ��������� - ���
/datum/gender
	var/He_ru   = "���"
	var/he_ru   = "���"
	var/His_ru  = "��"
	var/his_ru  = "��"
	var/him_ru  = "them"
	var/has_ru  = "have"
//	var/is_ru   = "are" // �� �� ���������� ��������������� ������� � �������
//	var/does_ru = "do" // �� �� ���������� ��������������� ������� � �������
//	var/self_ru = "themselves" // � ������� ����� ������������ ���������� �������, � �� ��������.

/datum/gender/plural
	formal_term = "other"

/datum/gender/male
	He_ru   = "He"
	he_ru   = "he"
	His_ru  = "His"
	his_ru  = "his"
	him_ru  = "him"
	has_ru  = "has"
	is_ru   = "is"
	does_ru = "does"
	self_ru = "himself"

/datum/gender/female
	He_ru   = "She"
	he_ru   = "she"
	His_ru  = "Her"
	his_ru  = "her"
	him_ru  = "her"
	has_ru  = "has"
	is_ru   = "is"
	does_ru = "does"
	self_ru = "herself"

/datum/gender/neuter
	formal_term = "other"

	He_ru   = "It"
	he_ru   = "it"
	His_ru  = "Its"
	his_ru  = "its"
	him_ru  = "it"
	has_ru  = "has"
	is_ru   = "is"
	does_ru = "does"
	self_ru = "itself"

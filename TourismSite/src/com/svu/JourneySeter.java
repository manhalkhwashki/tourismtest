package com.svu;

public class JourneySeter {
	public JourneySeter(){
		
	}
	public String getjn(String name) {
		switch(name) {
		case "ds": return "����";
		case "rds": return "��� ����";
		case "alep": return "���";
		case "ralep": return "��� ���";
		case "lat": return "��������";
		case "rlat": return "��� ��������";
		case "homs": return "���";
		case "rhomsi": return "��� ���";
		case "tat": return "�����";
		case "rtat": return "��� �����";
		case "hama": return "����";
		case "rhama": return "��� ����";
		case "zor": return "��� �����";
		case "rzor": return "��� ��� �����";
		case "haska": return "������";
		case "rhaska": return "��� ������";
		case "qn": return "��������";
		case "rqn": return "��� ��������";
		case "idleb": return "����";
		case "rdlep": return "��� ����";
		case "swe": return "��������";
		case "rswe": return "��� ��������";




		default: return "";
		}
		
	}

}

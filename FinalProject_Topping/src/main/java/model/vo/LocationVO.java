package model.vo;
/*
 * 작성 일자: 2016.11.25
 * 설명: 장소 위도, 경도를 저장하기 위한 클래스
 */
public class LocationVO {
	double longtitude;
	double latitude;

	public LocationVO() { }

	public LocationVO(double longtitude, double latitude) {
		this.longtitude = longtitude;
		this.latitude = latitude;
	}

	public double getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(double longtitude) {
		this.longtitude = longtitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	@Override
	public String toString() {
		return "LocationVO [longtitude=" + longtitude + ", latitude="
				+ latitude + "]";
	}

}

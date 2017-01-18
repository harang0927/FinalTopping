package model.vo;

/*
 * 작성 일자: 2016.11.25
 * 설명: 추천장소
 */
public class PlaceVO {
	String placeId; // PK
	LocationVO locationVO;
	String placeName; // Tip보드에서 위치 검색
	String placeDistrict; // 구 단위 검색
	String placeImgUrl;
	int toppingCount; // place topping_count

	public String getPlaceDistrict() {
		return placeDistrict;
	}

	// 팁 게시판
	public PlaceVO(String placeId, String placeName, String placeDistrict) {
		this.placeId = placeId;
		this.placeName = placeName;
		this.placeDistrict = placeDistrict;
	}

	// 액티비티
	public PlaceVO(String placeId, String placeDistrict) {
		this.placeId = placeId;
		this.placeDistrict = placeDistrict;
	}

	public PlaceVO() {	}
	
	public PlaceVO(String placeId, LocationVO locationVO, String placeName,
			String placeDistrict, String placeImgUrl) {
		this.placeId = placeId;
		this.locationVO = locationVO;
		this.placeName = placeName;
		this.placeDistrict = placeDistrict;
		this.placeImgUrl = placeImgUrl;
	}
	public void setPlaceDistrict(String placeDistrict) {
		this.placeDistrict = placeDistrict;
	}

	public PlaceVO(String placeId, LocationVO locationVO, String placeName,
			String placeImgUrl, int toppingCount) {
		this.placeId = placeId;
		this.locationVO = locationVO;
		this.placeName = placeName;
		this.placeImgUrl = placeImgUrl;
		this.toppingCount = toppingCount;
	}
	public PlaceVO(String placeId, LocationVO locationVO, String placeName,
			String placeImgUrl, String placeDistrict,int toppingCount) {
		this.placeId = placeId;
		this.locationVO = locationVO;
		this.placeName = placeName;
		this.placeDistrict = placeDistrict;
		this.placeImgUrl = placeImgUrl;
		this.toppingCount = toppingCount;
	}

	public String getPlaceId() {
		return placeId;
	}

	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}

	public LocationVO getLocationVO() {
		return locationVO;
	}

	public void setLocationVO(LocationVO locationVO) {
		this.locationVO = locationVO;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPlaceImgUrl() {
		return placeImgUrl;
	}

	public void setPlaceImgUrl(String placeImgUrl) {
		this.placeImgUrl = placeImgUrl;
	}

	public int getToppingCount() {
		return toppingCount;
	}

	public void setToppingCount(int toppingCount) {
		this.toppingCount = toppingCount;
	}

	@Override
	public String toString() {
		return "PlaceVO [placeId=" + placeId + ", locationVO=" + locationVO
				+ ", placeName=" + placeName + ", placeDistrict="
				+ placeDistrict + ", placeImgUrl=" + placeImgUrl
				+ ", toppingCount=" + toppingCount + "]";
	}
}

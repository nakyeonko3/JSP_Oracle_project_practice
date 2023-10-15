package chap10;

/**
 * @author dinfree
 *
 */
public class News {
	private int SongID;
	private String SongName;
	private String ArtistName;
	private String SongURL;
	private String PlaylistName;
	private String UpdatedDate;

	public int getSongID() {
		return SongID;
	}

	public void setSongID(int songID) {
		SongID = songID;
	}

	public String getSongName() {
		return SongName;
	}

	public void setSongName(String songName) {
		SongName = songName;
	}

	public String getArtistName() {
		return ArtistName;
	}

	public void setArtistName(String artistName) {
		ArtistName = artistName;
	}

	public String getSongURL() {
		return SongURL;
	}

	public void setSongURL(String songURL) {
		SongURL = songURL;
	}

	public String getPlaylistName() {
		return PlaylistName;
	}

	public void setPlaylistName(String playlistName) {
		PlaylistName = playlistName;
	}

	public String getUpdatedDate() {
		return UpdatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		UpdatedDate = updatedDate;
	}
}

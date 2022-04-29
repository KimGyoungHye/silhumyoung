package graph.model;

import java.util.ArrayList;
import java.util.List;

public class GraphJsonBean {
	private List<String> myLabels;
	private List<Integer> myData;
	public GraphJsonBean() {
		super();
	}
	public GraphJsonBean(List<GraphBean> graphList) {
		super();
		setMyLabels(graphList);
		setMyData(graphList);
	}
	public List<String> getMyLabels() {
		return myLabels;
	}
	public void setMyLabels(List<GraphBean> graphList) {
		List<String> labels = new ArrayList<String>();
		for(int i=0;i<graphList.size();i++) {
			labels.add(graphList.get(i).getX());
		}
		this.myLabels = labels;
	}
	public void setMyData(List<GraphBean> graphList) {
		List<Integer> labels = new ArrayList<Integer>();
		for(int i=0;i<graphList.size();i++) {
			labels.add(graphList.get(i).getY());
		}
		this.myData = labels;
	}
	public List<Integer> getMyData() {
		return myData;
	}
}

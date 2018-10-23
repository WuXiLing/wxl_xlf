package com.wxl.modules.sys.utils;

import static java.util.Comparator.comparing;
import static java.util.stream.Collectors.toList;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.wxl.common.provider.treetable.presistence.entity.TreeTableEntity;

public class TreeUtils {

	public static List<?> sort(List<? extends TreeTableEntity<?>> trees) {
		TreeTableEntity<?> rootTree = getRootTree(trees);

		List<TreeTableEntity<?>> treeDatas = new ArrayList<TreeTableEntity<?>>();
		Iterator<? extends TreeTableEntity<?>> iterable = trees.iterator();
		while (iterable.hasNext()) {
			TreeTableEntity<?> dEntity = iterable.next();
			treeDatas.add(dEntity);
			treeDatas.addAll(getChildrenTree(trees, dEntity.getId()));
		}
		return treeDatas;
	}

	private static List<TreeTableEntity<?>> getChildrenTree(List<? extends TreeTableEntity<?>> trees, String parentId) {
		return trees.stream().filter(d -> d.getParent().getId() == parentId).sorted(comparing(TreeTableEntity::getSort))
				.collect(toList());
	}

	private static TreeTableEntity<?> getRootTree(List<? extends TreeTableEntity<?>> trees) {
		for (TreeTableEntity<?> entity : trees) {
			if ("1".equals(entity.getId())) {
				return entity;
			}
		}
		return null;
	}

	public static void main(String[] args) {

	}

}

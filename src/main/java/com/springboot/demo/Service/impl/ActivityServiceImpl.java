package com.springboot.demo.Service.impl;

import com.springboot.demo.Dao.ActivityImageMapper;
import com.springboot.demo.Dao.ActivityMapper;
import com.springboot.demo.Entity.Activity;
import com.springboot.demo.Entity.ActivityImage;
import com.springboot.demo.Service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    ActivityMapper activityMapper;

    @Autowired
    ActivityImageMapper activityImageMapper;


    @Override
    public int getTotalCount(Map<String,String> map) {
        return this.activityMapper.getTotalCount(map);
    }

    @Override
    public List<Activity> getAllActivity(Map<String,String> map) {
        return this.activityMapper.getAllActivity(map);
    }

    @Override
    public Activity getActivityById(int id) {
        return this.activityMapper.getActivityById(id);
    }

    @Override
    public void update(Activity activity) {
        this.activityMapper.updateByPrimaryKey(activity);
    }

    //添加时 把activityId为空的图片设置activityId
    @Override
    public void add(Activity activity) {
        this.activityMapper.insert(activity);
        //找图片 设id
        List<ActivityImage> activityImageList = getImageByActivityId(0);
        if (!activityImageList.isEmpty()) {
            for (ActivityImage activityImage : activityImageList) {
                activityImage.setActivityId(activity.getId());
                activityImageMapper.updateByPrimaryKey(activityImage);
            }
        }
    }

    @Override
    public void delete(int deleteId) {
        this.activityMapper.deleteByPrimaryKey(deleteId);
    }

    @Override
    public int getTotalCountByUserId(Map<String, String> map) {
        return this.activityMapper.getTotalCountByUserId(map);
    }

    @Override
    public List<Activity> getAllActivityByUserId(Map<String, String> map) {
        return this.activityMapper.getAllActivityByUserId(map);
    }

    //保存图片
    @Override
    public int saveImage(ActivityImage activityImage) {
        activityImage.setDate(new Date());
        //如果新增加的活动上传图片则设置活动Id
        if (StringUtils.isEmpty(activityImage.getActivityId())){
            //设0
            activityImage.setActivityId(0);
        }
        this.activityImageMapper.insert(activityImage);
        String path = activityImage.getPath();
        return this.activityImageMapper.getImageByPath(path);
    }

    //查找图片
    @Override
    public List<ActivityImage> getImageByActivityId(int activityId) {
        return activityImageMapper.getImageByActivityId(activityId);
    }

    @Override
    public void imageDelete(int imageId) {
        this.activityImageMapper.deleteByPrimaryKey(imageId);
    }

    @Override
    public ActivityImage getImageById(int imageId) {
        return this.activityImageMapper.selectByPrimaryKey(imageId);
    }

    public final static String UPLOAD_FILE_PATH = "E:\\Github\\springboot_demo\\src\\main\\webapp\\image";

    @Override
    public void deleteImageByActivityId(int activityId) {
        //删除文件夹下文件
        List<ActivityImage> activityImageList = this.getImageByActivityId(activityId);//调用上面方法
        if(!activityImageList.isEmpty()) {//该活动有图片
            for (ActivityImage activityImage : activityImageList) {
                String filename = this.getImageById(activityImage.getId()).getPath().substring(7);
                //删除目录文件下的
                File folder = new File(UPLOAD_FILE_PATH);
                File[] files = folder.listFiles();
                for (File file : files) {
                    if (file.getName().equals(filename)) {
                        file.delete();
                    }
                }
            }
        }
        //删除图片数据库
        activityImageMapper.deleteImageByActivityId(activityId);

    }


}

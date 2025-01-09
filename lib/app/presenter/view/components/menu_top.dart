import 'package:flutter/material.dart';
import 'package:todo_list/utils/custom_colors.dart';

class MenuTop extends StatelessWidget {
  const MenuTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 8,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 2, color: CustomColors.blue)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Text('Taski',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: CustomColors.statePurple,
                      fontSize: 20)),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              Text('John', style: TextStyle(fontWeight: FontWeight.w500)),
              ClipOval(
                child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/6cd0/1d73/d411911e81e2399df614e2d7cd846b49?Expires=1736726400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lRRNXacUJVchxUIJAVTHwwfkSPU1ZoMNZBWmCXQNSZPebymxZoVc1bgYXQd1ou5cFPYXz4KtRxavmi37UuWRU9mo7STKMIxyK2clBlB9o3omJmFgFOPVr7FidGT83KH~JHxKPaoVd2H6GJfB8scmjFFDrBik5CH1ye1TRiMejKqhAhMqYWbQbIXyPztqS8Xb3XTeSAO5QDLSgnyQ-Bt8B1X7CuyYwUaGRAnq3d4eXZ9U2btUCCvuE9UYRB1LW31IM060pEfxSshAxPMLY8KkSj1rSGKq2HpKPxDFlSFqEOeZutt3dRgKgBnxjVH48qMqe-DYbdCEHYJv1tWABkpevA__',
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

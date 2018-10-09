# fast-ai-setup-on-gcp

Script for setting up [fastai](https://github.com/fastai/fastai) environment on Google Cloud Platform Compute engine.
There is [setup script part1](https://raw.githubusercontent.com/wontheone1/fast-ai-setup-on-gcp/master/setup.sh).

Run following in the terminal once you ssh into your GCP machine,
the script will set everything up for using fastai.

```
curl https://raw.githubusercontent.com/wontheone1/fast-ai-setup-on-gcp/e28519a5b592dc942879d3dc2a1851aac806c227/setup.sh | bash -x
```

Note that I haven't tested this out anywhere else then GCP Ubuntu 16.04 with NVIDIA Tesla K80 GPU but I think there's no reason it shouldn't work on other platform as long as it's Ubuntu 16.04. So if you test on other platforms and see that works, please let me know so that I can write here where else you can use this script.

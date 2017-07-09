<?php
/* ========================================================================
 * 路由类
 * 主要功能,解析URL
 * ======================================================================== */
namespace yphp;

class route
{
    public $controller;
    public $action;
    public $path;
    public $route;

    public function __construct()
    {
        $route = conf::all('route');
        if (isset($_SERVER['REQUEST_URI'])) {
            $pathStr = str_replace($_SERVER['SCRIPT_NAME'], '', $_SERVER['REQUEST_URI']);
            //丢掉?以及后面的参数
            $path = explode('?', $pathStr);
            //去掉多余的分隔符
            $path = explode('/', trim($path[0], '/'));
            if (isset($path[0]) && $path[0]) {
                $this->controller = $path[0];
            } else {
                $this->controller = $route['DEFAULT_CONTROLLER'];
            }
            unset($path[0]);
            //检测是否包含路由缩写
            if (isset($route['ROUTE'][$this->controller])) {
                $this->action = $route['ROUTE'][$this->controller][1];
                $this->controller = $route['ROUTE'][$this->controller][0];
            } else {
                if (isset($path[1]) && $path[1]) {
                    $have = strstr($path[1], '?', true);
                    if ($have) {
                        $this->action = $have;
                    } else {
                        $this->action = $path[1];
                    }

                } else {
                    $this->action = $route['DEFAULT_ACTION'];
                }
                unset($path[1]);
            }

            $this->path = array_merge($path);
            $pathLenth = count($path);
            $i = 0;
            while ($i < $pathLenth) {
                if (isset($this->path[$i + 1])) {
                    $_GET[$this->path[$i]] = $this->path[$i + 1];
                }
                $i = $i + 2;
            }
        } else {

            $this->controller = conf::get('DEFAULT_CONTROLLER', 'route');
            $this->action = conf::get('DEFAULT_ACTION', 'route');
        }
        // 设置当前控制器、方法名常量
        define('CONTROLLER',$this->controller);
        define('ACTION',$this->action);
    }

    public function urlVar($num, $default = false)
    {
        if (isset($this->path[$num])) {
            return $this->path[$num];
        } else {
            return $default;
        }
    }

    public function method()
    {
        return $_SERVER['REQUEST_METHOD'];
    }
}